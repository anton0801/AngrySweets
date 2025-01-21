import Foundation
import SpriteKit

class Buildings {
    
    func buildRandomLevel(scene: AngryGameScene) -> (Int, Int) {
        let levelRnd = Int.random(in: 1...6)
        
        if levelRnd == 1 {
            return buildAngryMap1(scene: scene)
        } else if levelRnd == 2 {
            return buildAngryMap2(scene: scene)
        } else if levelRnd == 3 {
            return buildAngryMap3(scene: scene)
        }
        
        return buildAngryMap3(scene: scene)
    }
    
    // return birds count, enemies count
    func buildAngryMap1(scene: AngryGameScene) -> (Int, Int) {
        let palkaNode1 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode1.position = CGPoint(x: scene.size.width - 320, y: 330)
        palkaNode1.physicsBody = SKPhysicsBody(rectangleOf: palkaNode1.size)
        palkaNode1.physicsBody?.isDynamic = true
        palkaNode1.physicsBody?.affectedByGravity = false
        palkaNode1.physicsBody?.categoryBitMask = 2
        palkaNode1.physicsBody?.collisionBitMask = 1
        palkaNode1.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode1)
        
        let palkaNode2 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode2.position = CGPoint(x: scene.size.width - 460, y: 330)
        palkaNode2.physicsBody = SKPhysicsBody(rectangleOf: palkaNode2.size)
        palkaNode2.physicsBody?.isDynamic = true
        palkaNode2.physicsBody?.affectedByGravity = false
        palkaNode2.physicsBody?.categoryBitMask = 2
        palkaNode2.physicsBody?.collisionBitMask = 1
        palkaNode2.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode2)
        
        let horizontalPalka = SKSpriteNode(imageNamed: "horizontal_palka")
        horizontalPalka.position = CGPoint(x: scene.size.width - 390, y: 300)
        horizontalPalka.physicsBody = SKPhysicsBody(rectangleOf: horizontalPalka.size)
        horizontalPalka.physicsBody?.isDynamic = true
        horizontalPalka.physicsBody?.affectedByGravity = false
        horizontalPalka.physicsBody?.categoryBitMask = 2
        horizontalPalka.physicsBody?.collisionBitMask = 1
        horizontalPalka.physicsBody?.contactTestBitMask = 1
        scene.addChild(horizontalPalka)
        
        let enemy1 = SKSpriteNode(imageNamed: "enemy_1")
        enemy1.position = CGPoint(x: scene.size.width - 390, y: 210)
        enemy1.physicsBody = SKPhysicsBody(circleOfRadius: enemy1.size.width / 2)
        enemy1.physicsBody?.isDynamic = true
        enemy1.physicsBody?.affectedByGravity = false
        enemy1.physicsBody?.categoryBitMask = 3
        enemy1.physicsBody?.collisionBitMask = 1
        enemy1.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy1)
        
        let enemy2 = SKSpriteNode(imageNamed: "enemy_2")
        enemy2.position = CGPoint(x: scene.size.width - 390, y: 370)
        enemy2.physicsBody = SKPhysicsBody(circleOfRadius: enemy1.size.width / 2)
        enemy2.physicsBody?.isDynamic = true
        enemy2.physicsBody?.affectedByGravity = false
        enemy2.physicsBody?.categoryBitMask = 3
        enemy2.physicsBody?.collisionBitMask = 1
        enemy2.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy2)
        
        return (4, 2)
    }
    
    // return birds count, enemies count
    func buildAngryMap2(scene: AngryGameScene) -> (Int, Int) {
        let palkaNode1 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode1.position = CGPoint(x: scene.size.width - 320, y: 330)
        palkaNode1.physicsBody = SKPhysicsBody(rectangleOf: palkaNode1.size)
        palkaNode1.physicsBody?.isDynamic = true
        palkaNode1.physicsBody?.affectedByGravity = false
        palkaNode1.physicsBody?.categoryBitMask = 2
        palkaNode1.physicsBody?.collisionBitMask = 1
        palkaNode1.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode1)
        
        let palkaNode2 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode2.position = CGPoint(x: scene.size.width - 460, y: 330)
        palkaNode2.physicsBody = SKPhysicsBody(rectangleOf: palkaNode2.size)
        palkaNode2.physicsBody?.isDynamic = true
        palkaNode2.physicsBody?.affectedByGravity = false
        palkaNode2.physicsBody?.categoryBitMask = 2
        palkaNode2.physicsBody?.collisionBitMask = 1
        palkaNode2.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode2)
        
        let horizontalPalka = SKSpriteNode(imageNamed: "horizontal_palka")
        horizontalPalka.position = CGPoint(x: scene.size.width - 390, y: 300)
        horizontalPalka.physicsBody = SKPhysicsBody(rectangleOf: horizontalPalka.size)
        horizontalPalka.physicsBody?.isDynamic = true
        horizontalPalka.physicsBody?.affectedByGravity = false
        horizontalPalka.physicsBody?.categoryBitMask = 2
        horizontalPalka.physicsBody?.collisionBitMask = 1
        horizontalPalka.physicsBody?.contactTestBitMask = 1
        scene.addChild(horizontalPalka)
        
        let horizontalPalka2 = SKSpriteNode(imageNamed: "horizontal_palka")
        horizontalPalka2.position = CGPoint(x: scene.size.width - 390, y: 420)
        horizontalPalka2.physicsBody = SKPhysicsBody(rectangleOf: horizontalPalka2.size)
        horizontalPalka2.physicsBody?.isDynamic = true
        horizontalPalka2.physicsBody?.affectedByGravity = false
        horizontalPalka2.physicsBody?.categoryBitMask = 2
        horizontalPalka2.physicsBody?.collisionBitMask = 1
        horizontalPalka2.physicsBody?.contactTestBitMask = 1
        scene.addChild(horizontalPalka2)
        
        let enemy1 = SKSpriteNode(imageNamed: "enemy_1")
        enemy1.position = CGPoint(x: scene.size.width - 390, y: 210)
        enemy1.physicsBody = SKPhysicsBody(circleOfRadius: enemy1.size.width / 2)
        enemy1.physicsBody?.isDynamic = true
        enemy1.physicsBody?.affectedByGravity = false
        enemy1.physicsBody?.categoryBitMask = 3
        enemy1.physicsBody?.collisionBitMask = 1
        enemy1.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy1)
        
        let enemy2 = SKSpriteNode(imageNamed: "enemy_2")
        enemy2.position = CGPoint(x: scene.size.width - 390, y: 370)
        enemy2.physicsBody = SKPhysicsBody(circleOfRadius: enemy2.size.width / 2)
        enemy2.physicsBody?.isDynamic = true
        enemy2.physicsBody?.affectedByGravity = false
        enemy2.physicsBody?.categoryBitMask = 3
        enemy2.physicsBody?.collisionBitMask = 1
        enemy2.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy2)
        
        let enemy3 = SKSpriteNode(imageNamed: "enemy_2")
        enemy3.position = CGPoint(x: scene.size.width - 390, y: 440)
        enemy3.physicsBody = SKPhysicsBody(circleOfRadius: enemy3.size.width / 2)
        enemy3.physicsBody?.isDynamic = true
        enemy3.physicsBody?.affectedByGravity = false
        enemy3.physicsBody?.categoryBitMask = 3
        enemy3.physicsBody?.collisionBitMask = 1
        enemy3.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy3)
        
        let palkaNode3 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode3.position = CGPoint(x: scene.size.width - 220, y: 330)
        palkaNode3.physicsBody = SKPhysicsBody(rectangleOf: palkaNode3.size)
        palkaNode3.physicsBody?.isDynamic = true
        palkaNode3.physicsBody?.affectedByGravity = false
        palkaNode3.physicsBody?.categoryBitMask = 2
        palkaNode3.physicsBody?.collisionBitMask = 1
        palkaNode3.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode3)
        
        let palkaNode4 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode4.position = CGPoint(x: scene.size.width - 360, y: 330)
        palkaNode4.physicsBody = SKPhysicsBody(rectangleOf: palkaNode4.size)
        palkaNode4.physicsBody?.isDynamic = true
        palkaNode4.physicsBody?.affectedByGravity = false
        palkaNode4.physicsBody?.categoryBitMask = 2
        palkaNode4.physicsBody?.collisionBitMask = 1
        palkaNode4.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode4)
        
        let enemy4 = SKSpriteNode(imageNamed: "enemy_1")
        enemy4.position = CGPoint(x: scene.size.width - 290, y: 280)
        enemy4.physicsBody = SKPhysicsBody(circleOfRadius: enemy4.size.width / 2)
        enemy4.physicsBody?.isDynamic = true
        enemy4.physicsBody?.affectedByGravity = false
        enemy4.physicsBody?.categoryBitMask = 3
        enemy4.physicsBody?.collisionBitMask = 1
        enemy4.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy4)
        
        let enemy5 = SKSpriteNode(imageNamed: "enemy_1")
        enemy5.position = CGPoint(x: scene.size.width - 290, y: 370)
        enemy5.physicsBody = SKPhysicsBody(circleOfRadius: enemy5.size.width / 2)
        enemy5.physicsBody?.isDynamic = true
        enemy5.physicsBody?.affectedByGravity = false
        enemy5.physicsBody?.categoryBitMask = 3
        enemy5.physicsBody?.collisionBitMask = 1
        enemy5.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy5)
        
        return (7, 5)
    }
    
    // return birds count, enemies count
    func buildAngryMap3(scene: AngryGameScene) -> (Int, Int) {
        let palkaNode1 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode1.position = CGPoint(x: scene.size.width - 320, y: 330)
        palkaNode1.physicsBody = SKPhysicsBody(rectangleOf: palkaNode1.size)
        palkaNode1.physicsBody?.isDynamic = true
        palkaNode1.physicsBody?.affectedByGravity = false
        palkaNode1.physicsBody?.categoryBitMask = 2
        palkaNode1.physicsBody?.collisionBitMask = 1
        palkaNode1.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode1)
        
        let palkaNode2 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode2.position = CGPoint(x: scene.size.width - 460, y: 330)
        palkaNode2.physicsBody = SKPhysicsBody(rectangleOf: palkaNode2.size)
        palkaNode2.physicsBody?.isDynamic = true
        palkaNode2.physicsBody?.affectedByGravity = false
        palkaNode2.physicsBody?.categoryBitMask = 2
        palkaNode2.physicsBody?.collisionBitMask = 1
        palkaNode2.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode2)
        
        let horizontalPalka = SKSpriteNode(imageNamed: "horizontal_palka")
        horizontalPalka.position = CGPoint(x: scene.size.width - 390, y: 300)
        horizontalPalka.physicsBody = SKPhysicsBody(rectangleOf: horizontalPalka.size)
        horizontalPalka.physicsBody?.isDynamic = true
        horizontalPalka.physicsBody?.affectedByGravity = false
        horizontalPalka.physicsBody?.categoryBitMask = 2
        horizontalPalka.physicsBody?.collisionBitMask = 1
        horizontalPalka.physicsBody?.contactTestBitMask = 1
        scene.addChild(horizontalPalka)
        
        let horizontalPalka2 = SKSpriteNode(imageNamed: "horizontal_palka")
        horizontalPalka2.position = CGPoint(x: scene.size.width - 390, y: 420)
        horizontalPalka2.physicsBody = SKPhysicsBody(rectangleOf: horizontalPalka2.size)
        horizontalPalka2.physicsBody?.isDynamic = true
        horizontalPalka2.physicsBody?.affectedByGravity = false
        horizontalPalka2.physicsBody?.categoryBitMask = 2
        horizontalPalka2.physicsBody?.collisionBitMask = 1
        horizontalPalka2.physicsBody?.contactTestBitMask = 1
        scene.addChild(horizontalPalka2)
        
        let enemy1 = SKSpriteNode(imageNamed: "enemy_1")
        enemy1.position = CGPoint(x: scene.size.width - 390, y: 210)
        enemy1.physicsBody = SKPhysicsBody(circleOfRadius: enemy1.size.width / 2)
        enemy1.physicsBody?.isDynamic = true
        enemy1.physicsBody?.affectedByGravity = false
        enemy1.physicsBody?.categoryBitMask = 3
        enemy1.physicsBody?.collisionBitMask = 1
        enemy1.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy1)
        
        let enemy2 = SKSpriteNode(imageNamed: "enemy_2")
        enemy2.position = CGPoint(x: scene.size.width - 390, y: 370)
        enemy2.physicsBody = SKPhysicsBody(circleOfRadius: enemy2.size.width / 2)
        enemy2.physicsBody?.isDynamic = true
        enemy2.physicsBody?.affectedByGravity = false
        enemy2.physicsBody?.categoryBitMask = 3
        enemy2.physicsBody?.collisionBitMask = 1
        enemy2.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy2)
        
        let enemy3 = SKSpriteNode(imageNamed: "enemy_2")
        enemy3.position = CGPoint(x: scene.size.width - 390, y: 440)
        enemy3.physicsBody = SKPhysicsBody(circleOfRadius: enemy3.size.width / 2)
        enemy3.physicsBody?.isDynamic = true
        enemy3.physicsBody?.affectedByGravity = false
        enemy3.physicsBody?.categoryBitMask = 3
        enemy3.physicsBody?.collisionBitMask = 1
        enemy3.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy3)
        
        let palkaNode3 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode3.position = CGPoint(x: scene.size.width - 220, y: 330)
        palkaNode3.physicsBody = SKPhysicsBody(rectangleOf: palkaNode3.size)
        palkaNode3.physicsBody?.isDynamic = true
        palkaNode3.physicsBody?.affectedByGravity = false
        palkaNode3.physicsBody?.categoryBitMask = 2
        palkaNode3.physicsBody?.collisionBitMask = 1
        palkaNode3.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode3)
        
        let palkaNode4 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode4.position = CGPoint(x: scene.size.width - 360, y: 330)
        palkaNode4.physicsBody = SKPhysicsBody(rectangleOf: palkaNode4.size)
        palkaNode4.physicsBody?.isDynamic = true
        palkaNode4.physicsBody?.affectedByGravity = false
        palkaNode4.physicsBody?.categoryBitMask = 2
        palkaNode4.physicsBody?.collisionBitMask = 1
        palkaNode4.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode4)
        
        let enemy4 = SKSpriteNode(imageNamed: "enemy_1")
        enemy4.position = CGPoint(x: scene.size.width - 290, y: 280)
        enemy4.physicsBody = SKPhysicsBody(circleOfRadius: enemy4.size.width / 2)
        enemy4.physicsBody?.isDynamic = true
        enemy4.physicsBody?.affectedByGravity = false
        enemy4.physicsBody?.categoryBitMask = 3
        enemy4.physicsBody?.collisionBitMask = 1
        enemy4.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy4)
        
        let enemy5 = SKSpriteNode(imageNamed: "enemy_1")
        enemy5.position = CGPoint(x: scene.size.width - 290, y: 370)
        enemy5.physicsBody = SKPhysicsBody(circleOfRadius: enemy5.size.width / 2)
        enemy5.physicsBody?.isDynamic = true
        enemy5.physicsBody?.affectedByGravity = false
        enemy5.physicsBody?.categoryBitMask = 3
        enemy5.physicsBody?.collisionBitMask = 1
        enemy5.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy5)
        
        let palkaNode5 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode5.position = CGPoint(x: scene.size.width - 520, y: 330)
        palkaNode5.physicsBody = SKPhysicsBody(rectangleOf: palkaNode5.size)
        palkaNode5.physicsBody?.isDynamic = true
        palkaNode5.physicsBody?.affectedByGravity = false
        palkaNode5.physicsBody?.categoryBitMask = 2
        palkaNode5.physicsBody?.collisionBitMask = 1
        palkaNode5.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode5)
        
        let palkaNode6 = SKSpriteNode(imageNamed: "vertical_palka")
        palkaNode6.position = CGPoint(x: scene.size.width - 660, y: 330)
        palkaNode6.physicsBody = SKPhysicsBody(rectangleOf: palkaNode6.size)
        palkaNode6.physicsBody?.isDynamic = true
        palkaNode6.physicsBody?.affectedByGravity = false
        palkaNode6.physicsBody?.categoryBitMask = 2
        palkaNode6.physicsBody?.collisionBitMask = 1
        palkaNode6.physicsBody?.contactTestBitMask = 1
        scene.addChild(palkaNode6)
        
        let horizontalPalka3 = SKSpriteNode(imageNamed: "horizontal_palka")
        horizontalPalka3.position = CGPoint(x: scene.size.width - 590, y: 300)
        horizontalPalka3.physicsBody = SKPhysicsBody(rectangleOf: horizontalPalka3.size)
        horizontalPalka3.physicsBody?.isDynamic = true
        horizontalPalka3.physicsBody?.affectedByGravity = false
        horizontalPalka3.physicsBody?.categoryBitMask = 2
        horizontalPalka3.physicsBody?.collisionBitMask = 1
        horizontalPalka3.physicsBody?.contactTestBitMask = 1
        scene.addChild(horizontalPalka3)
        
        let enemy6 = SKSpriteNode(imageNamed: "enemy_1")
        enemy6.position = CGPoint(x: scene.size.width - 590, y: 220)
        enemy6.physicsBody = SKPhysicsBody(circleOfRadius: enemy6.size.width / 2)
        enemy6.physicsBody?.isDynamic = true
        enemy6.physicsBody?.affectedByGravity = false
        enemy6.physicsBody?.categoryBitMask = 3
        enemy6.physicsBody?.collisionBitMask = 1
        enemy6.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy6)
        
        let enemy7 = SKSpriteNode(imageNamed: "enemy_1")
        enemy7.position = CGPoint(x: scene.size.width - 590, y: 390)
        enemy7.physicsBody = SKPhysicsBody(circleOfRadius: enemy7.size.width / 2)
        enemy7.physicsBody?.isDynamic = true
        enemy7.physicsBody?.affectedByGravity = false
        enemy7.physicsBody?.categoryBitMask = 3
        enemy7.physicsBody?.collisionBitMask = 1
        enemy7.physicsBody?.contactTestBitMask = 1
        scene.addChild(enemy7)
        
        return (8, 7)
    }
    
    
    
}
