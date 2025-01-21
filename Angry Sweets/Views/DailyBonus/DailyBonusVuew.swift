import SwiftUI

struct DailyBonusVuew: View {

    @Environment(\.presentationMode) var pres
    
    @State var haveSpins = 0
    
    @State private var rotationAngle: Double = 0
    @State private var isSpinning = false
    @State private var selectedReward: String?
    
    @State var balance = 0
    
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
                    Image("daily_title")
                    Spacer()
                    Image("back_btn")
                        .opacity(0)
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack {
                    Button {
                        if haveSpins > 0 {
                            spinWheel()
                        }
                    } label: {
                        if haveSpins > 0 {
                            Image("spin_btn")
                        } else {
                            Image("spin_btn")
                                .opacity(0.6)
                        }
                    }
                    
                    ZStack {
                        Image("daily_rewards_roulette")
                            .rotationEffect(Angle(degrees: rotationAngle))
                        Image("indicator")
                            .offset(y: -120)
                    }
                    
                    ZStack {
                        Image("value_bg")
                        Text("You have:\n\(haveSpins) Spins")
                            .font(.custom("Lemon-Regular", size: 24))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                }
                
            }
        }
        .onAppear {
            haveSpins = UserDefaults.standard.integer(forKey: "have_spins_daily_bonus")
            balance = UserDefaults.standard.integer(forKey: "balance")
        }
        .onChange(of: balance) { newBalance in
            UserDefaults.standard.set(newBalance, forKey: "balance")
        }
        .onChange(of: haveSpins) { newSpins in
            UserDefaults.standard.set(newSpins, forKey: "have_spins_daily_bonus")
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
    
    private func spinWheel() {
        guard !isSpinning else { return } // Prevent multiple spins at once
        
        isSpinning = true
        let randomSpin = Double(4) * 360
        let finalAngle = randomSpin + 30
        
        withAnimation(Animation.easeOut(duration: 3)) {
            rotationAngle += finalAngle
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            balance += 300
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isSpinning = false
        }
        haveSpins -= 1
    }
    
}

#Preview {
    DailyBonusVuew()
}
