import SwiftUI

struct GameOverView: View {
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Image("game_state_image")
                    Spacer()
                    ZStack {
                        Button {
                            NotificationCenter.default.post(name: Notification.Name("to_menu_action"), object: nil)
                        } label: {
                            Image("menu_btn")
                        }
                        .offset(x: -70, y: -140)
                        Button {
                            NotificationCenter.default.post(name: Notification.Name("restart_action"), object: nil)
                        } label: {
                            Image("restart_btn")
                        }
                        .offset(x: -110, y: 50)
                    }
                    .offset(x: 0, y: 50)
                }
            }
            VStack {
                Image("game_over")
                Spacer()
            }
        }
        .background(
            Image("game_state_bg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height + 25)
                .ignoresSafeArea()
                .opacity(0.7)
        )
    }
    
}

#Preview {
    GameOverView()
}
