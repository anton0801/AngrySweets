import SwiftUI

struct MainMenuAngry: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("girl_sweets")
                        .offset(y: 20)
                    Spacer()
                    ZStack {
                        NavigationLink(destination: DailyBonusVuew()
                            .navigationBarBackButtonHidden()) {
                            Image("daily_btn")
                        }
                        .offset(x: -100, y: -90)
                        NavigationLink(destination: ShopProductTypes()
                            .navigationBarBackButtonHidden()) {
                            Image("shop_btn")
                        }
                        .offset(x: -10, y: 0)
                        NavigationLink(destination: SettingsView()
                            .navigationBarBackButtonHidden()) {
                            Image("settings_btn")
                        }
                        .offset(x: -100, y: 90)
                        NavigationLink(destination: AngryGameView()
                            .navigationBarBackButtonHidden()) {
                            Image("play_btn")
                        }
                        .offset(x: -210, y: 0)
                    }
                }
            }
            .onAppear {
                if !UserDefaults.standard.bool(forKey: "first_setup") {
                    UserDefaults.standard.set(1, forKey: "have_spins_daily_bonus")
                    UserDefaults.standard.set(true, forKey: "first_setup")
                }
            }
            .background(
                Image("main_background")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height + 25)
                    .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    MainMenuAngry()
}
