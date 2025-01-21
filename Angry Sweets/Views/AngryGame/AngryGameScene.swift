import SwiftUI
import SpriteKit

class AngryGameScene: SKScene, SKPhysicsContactDelegate {
    
    private var rogatkaNode: SKSpriteNode!
    
    private var pauseBtn: SKSpriteNode!
    
    private var birdsCount = 0 {
        didSet {
            birdsLabel.text = "x\(birdsCount)"
            if birdsCount == 0 {
                isPaused = true
                NotificationCenter.default.post(name: Notification.Name("lose_game"), object: nil)
            }
        }
    }
    private var enemiesCount = 0 {
        didSet {
            enemiesLabel.text = "x\(enemiesCount)"
            if enemiesCount == 0 {
                isPaused = true
                NotificationCenter.default.post(name: Notification.Name("win_game"), object: nil)
            }
        }
    }
    
    private var birdsLabel: SKLabelNode!
    private var enemiesLabel: SKLabelNode!
    
    private var birdNodes: [SKNode] = []
    
    private var time = 120
    private var timeLabel: SKLabelNode!
    
    
    private var trajectoryPath: [SKShapeNode] = []
    private var isDragging = false
    
    func resumeGame() {
        isPaused = false
    }
    
    func restartGame() -> AngryGameScene {
        let angryNewScene = AngryGameScene()
        view?.presentScene(angryNewScene)
        return  angryNewScene
    }
    
    override func didMove(to view: SKView) {
        size = CGSize(width: 1350, height: 750)
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        let buldings = Buildings()
        let gameDataBuilding = buldings.buildRandomLevel(scene: self)
        
        background()
        rogatka()
        createButtons()
        
        birdsCount = gameDataBuilding.0
        enemiesCount = gameDataBuilding.1
        
        createBirds()
    }
    
    private func background() {
        let backName = UserDefaults.standard.string(forKey: "selected_back") ?? "default_back"
        let backNode = SKSpriteNode(imageNamed: backName)
        backNode.size = size
        backNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        backNode.zPosition = -1
        addChild(backNode)
        
        let groundNode = SKSpriteNode(imageNamed: "ground")
        groundNode.size = CGSize(width: size.width, height: 250)
        groundNode.position = CGPoint(x: size.width / 2, y: groundNode.size.height / 2)
        addChild(groundNode)
    }
    
    private func rogatka() {
        rogatkaNode = SKSpriteNode(imageNamed: "rogatka")
        rogatkaNode.size = CGSize(width: rogatkaNode.size.width, height: 300)
        rogatkaNode.position = CGPoint(x: 210, y: 280)
        addChild(rogatkaNode)
    }
    
    private func createButtons() {
        pauseBtn = SKSpriteNode(imageNamed: "pause_btn")
        pauseBtn.position = CGPoint(x: 100, y: size.height - 100)
        addChild(pauseBtn)
        
        let birdsValuesBg = SKSpriteNode(imageNamed: "plashka")
        birdsValuesBg.position = CGPoint(x: 250, y: size.height - 100)
        addChild(birdsValuesBg)
        
        let birdsValues = SKSpriteNode(imageNamed: "skin_birds")
        birdsValues.position = CGPoint(x: 200, y: size.height - 100)
        addChild(birdsValues)
        
        birdsLabel = SKLabelNode(text: "x\(birdsCount)")
        birdsLabel.position = CGPoint(x: 260, y: size.height - 110)
        birdsLabel.fontColor = .white
        birdsLabel.fontSize = 24
        birdsLabel.fontName = "Lemon-Regular"
        addChild(birdsLabel)
        
        let timeValuesBg = SKSpriteNode(imageNamed: "plashka_2")
        timeValuesBg.position = CGPoint(x: 430, y: size.height - 100)
        addChild(timeValuesBg)
        
        let timeIcon = SKSpriteNode(imageNamed: "time")
        timeIcon.position = CGPoint(x: 370, y: size.height - 100)
        addChild(timeIcon)
        
        timeLabel = SKLabelNode(text: "2:00")
        timeLabel.position = CGPoint(x: 440, y: size.height - 110)
        timeLabel.fontColor = .white
        timeLabel.fontSize = 24
        timeLabel.fontName = "Lemon-Regular"
        addChild(timeLabel)
        
        let enemiesValuesBg = SKSpriteNode(imageNamed: "plashka")
        enemiesValuesBg.position = CGPoint(x: 620, y: size.height - 100)
        addChild(enemiesValuesBg)
        
        let enemiesValues = SKSpriteNode(imageNamed: "enemy_1")
        enemiesValues.position = CGPoint(x: 540, y: size.height - 100)
        addChild(enemiesValues)
        
        enemiesLabel = SKLabelNode(text: "x\(enemiesCount)")
        enemiesLabel.position = CGPoint(x: 620, y: size.height - 110)
        enemiesLabel.fontColor = .white
        enemiesLabel.fontSize = 24
        enemiesLabel.fontName = "Lemon-Regular"
        addChild(enemiesLabel)
    }
    
    private func createBirds() {
        for birdIndex in 0..<birdsCount {
            let birdNode = SKSpriteNode(imageNamed: "skin_birds")
            let xPos = 50 + (birdIndex * Int(birdNode.size.width + 5))
            birdNode.position = CGPoint(x: xPos, y: 170)
            birdNode.physicsBody = SKPhysicsBody(circleOfRadius: birdNode.size.width / 2)
            birdNode.physicsBody?.isDynamic = true
            birdNode.physicsBody?.affectedByGravity = false
            birdNode.physicsBody?.categoryBitMask = 1
            birdNode.physicsBody?.collisionBitMask = 2 | 3
            birdNode.physicsBody?.contactTestBitMask = 2 | 3
            addChild(birdNode)
            birdNodes.append(birdNode)
        }
        let firstNode = birdNodes[0]
        firstNode.run(SKAction.sequence([
            SKAction.move(to: CGPoint(x: 20, y: 250), duration: 0.5),
            SKAction.move(to: CGPoint(x: 200, y: 360), duration: 0.5),
        ]))
    }
    
    private func calculateTrajectory(start: CGPoint, velocity: CGVector) -> [CGPoint] {
        let steps = 50
        let dt: CGFloat = 0.1
        var points: [CGPoint] = []
        var position = start
        var velocity = velocity
        
        for _ in 0..<steps {
            velocity.dy += physicsWorld.gravity.dy * dt
            position.x += velocity.dx * dt
            position.y += velocity.dy * dt
            points.append(position)
        }
        return points
    }
    
    private func showTrajectory(points: [CGPoint]) {
        clearTrajectory()
        for point in points {
            let dot = SKShapeNode(circleOfRadius: 3)
            dot.fillColor = .red
            dot.position = point
            dot.zPosition = 5
            addChild(dot)
            trajectoryPath.append(dot)
        }
    }
    
    private func clearTrajectory() {
        for dot in trajectoryPath {
            dot.removeFromParent()
        }
        trajectoryPath.removeAll()
    }
    
    // Обработка касаний
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let bird = birdNodes[0]
        let location = touch.location(in: self)
        
        if bird.contains(location) {
            isDragging = true
        }
        
        if pauseBtn == atPoint(location) {
            isPaused = true
            NotificationCenter.default.post(name: Notification.Name("paused_action"), object: nil)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first else { return }
        let bird = birdNodes[0]
        let location = touch.location(in: self)
        
        let dx = rogatkaNode.position.x - location.x
        let dy = rogatkaNode.position.y - location.y
        bird.position = location
        
        let velocity = CGVector(dx: dx * 5, dy: dy * 5)
        let trajectory = calculateTrajectory(start: bird.position, velocity: velocity)
        showTrajectory(points: trajectory)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging else { return }
        let bird = birdNodes[0]
        isDragging = false
        
        let dx = rogatkaNode.position.x - bird.position.x
        let dy = rogatkaNode.position.y - bird.position.y
        let velocity = CGVector(dx: dx * 10, dy: dy * 9)
        
        bird.physicsBody?.affectedByGravity = true
        bird.physicsBody?.velocity = velocity
        clearTrajectory()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if birdNodes.count > 0 {
            if birdNodes[0].position.y <= 0 || birdNodes[0].position.x >= size.width {
                birdNodes[0].removeFromParent()
                birdNodes.remove(at: 0)
                let firstNode = birdNodes[0]
                firstNode.run(SKAction.sequence([
                    SKAction.move(to: CGPoint(x: 20, y: 250), duration: 0.5),
                    SKAction.move(to: CGPoint(x: 200, y: 360), duration: 0.5),
                ]))
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactA = contact.bodyA
        let contactB = contact.bodyB
        
        if (contactA.categoryBitMask == 1 && contactB.categoryBitMask == 2) || (contactA.categoryBitMask == 2 && contactB.categoryBitMask == 1) {
            var palkaNode: SKPhysicsBody = contactB
            if contactB.categoryBitMask == 1 {
                palkaNode = contactA
            }
            if let node = palkaNode.node {
                node.removeFromParent()
            }
        }
        
        if (contactA.categoryBitMask == 1 && contactB.categoryBitMask == 3) || (contactA.categoryBitMask == 3 && contactB.categoryBitMask == 1) {
            var palkaNode: SKPhysicsBody = contactB
            if contactB.categoryBitMask == 1 {
                palkaNode = contactA
            }
            if let node = palkaNode.node {
                node.removeFromParent()
                enemiesCount -= 1
            }
        }
    }
    
}

#Preview {
    VStack {
        SpriteView(scene: AngryGameScene())
            .ignoresSafeArea()
    }
}
