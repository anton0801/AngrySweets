import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var pres
    
    @State var musicOn = false
    @State var soundsOn = false
    @State var notifications = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        pres.wrappedValue.dismiss()
                    } label: {
                        Image("back_btn")
                    }
                    .padding(.top)
                    Spacer()
                    Image("settings_title")
                    Spacer()
                    Image("back_btn")
                        .opacity(0)
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                ZStack {
                    Image("settings_values_back")
                    VStack {
                        HStack {
                            Text("Music")
                                .font(.custom("Lemon-Regular", size: 24))
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                withAnimation(.linear) {
                                    musicOn = !musicOn
                                }
                            } label: {
                                if musicOn {
                                    Image("toggle_active")
                                } else {
                                    Image("toggle_inactive")
                                }
                            }
                        }
                        HStack {
                            Text("Sounds")
                                .font(.custom("Lemon-Regular", size: 24))
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                withAnimation(.linear) {
                                    soundsOn = !soundsOn
                                }
                            } label: {
                                if soundsOn {
                                    Image("toggle_active")
                                } else {
                                    Image("toggle_inactive")
                                }
                            }
                        }
                        HStack {
                            Text("Notifications")
                                .font(.custom("Lemon-Regular", size: 24))
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                withAnimation(.linear) {
                                    notifications = !notifications
                                }
                            } label: {
                                if notifications {
                                    Image("toggle_active")
                                } else {
                                    Image("toggle_inactive")
                                }
                            }
                        }
                    }
                    .frame(width: 320)
                }
                .padding(.bottom)
            }
        }
        .onAppear {
            musicOn = UserDefaults.standard.bool(forKey: "music_on")
            soundsOn = UserDefaults.standard.bool(forKey: "sounds_on")
            notifications = UserDefaults.standard.bool(forKey: "notifications_on")
        }
        .onChange(of: musicOn) { newState in
            UserDefaults.standard.set(newState, forKey: "music_on")
        }
        .onChange(of: soundsOn) { newState in
            UserDefaults.standard.set(newState, forKey: "sounds_on")
        }
        .onChange(of: notifications) { newState in
            UserDefaults.standard.set(newState, forKey: "notifications_on")
        }
        .preferredColorScheme(.dark)
        .background(
            Image("main_background")
                .resizable()
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height + 25)
                .ignoresSafeArea()
                .opacity(0.7)
        )
    }
}

#Preview {
    SettingsView()
}
