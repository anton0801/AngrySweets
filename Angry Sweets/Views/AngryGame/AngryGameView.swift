import SwiftUI
import SpriteKit

struct AngryGameView: View {
    
    @State var scene: AngryGameScene!
    
    @State var gamePaused = false
    @State var gameWin = false
    @State var gameOver = false
    
    @Environment(\.presentationMode) var presMode
    
    var body: some View {
        ZStack {
            if let scene = scene {
                SpriteView(scene: scene)
                    .ignoresSafeArea()
            }
            
            if gamePaused {
                PausedGameView()
            }
            if gameWin {
                WinGameView()
            }
            if gameOver {
                GameOverView()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("to_menu_action")), perform: { _ in
            presMode.wrappedValue.dismiss()
        })
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("restart_action")), perform: { _ in
            scene = scene.restartGame()
            withAnimation(.linear) {
                gamePaused = false
                gameWin = false
                gameOver = false
            }
        })
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("continue_play_action")), perform: { _ in
            scene.resumeGame()
            withAnimation(.linear) {
                gamePaused = false
                gameWin = false
                gameOver = false
            }
        })
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("win_game")), perform: { _ in
            withAnimation(.linear) {
                gameWin = true
            }
        })
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("lose_game")), perform: { _ in
            withAnimation(.linear) {
                gameOver = true
            }
        })
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("paused_action")), perform: { _ in
            withAnimation(.linear) {
                gamePaused = true
            }
        })
        .onAppear {
            scene = AngryGameScene()
        }
    }
}

#Preview {
    AngryGameView()
}
