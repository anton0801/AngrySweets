import SwiftUI

struct ShopProductTypes: View {
    
    @Environment(\.presentationMode) var pres
    
    @State var balance = 0
    
    @StateObject var iapManager: IAPManager = IAPManager()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        pres.wrappedValue.dismiss()
                    } label: {
                        Image("back_btn")
                    }
                    .padding(.top)
                    Spacer()
                    Image("shop_title")
                    Spacer()
                    ZStack {
                        Image("balance_bg")
                        Text("\(balance)")
                            .font(.custom("Lemon-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                }
                
                HStack {
                    NavigationLink(destination: ShopBackgroundsView()
                        .navigationBarBackButtonHidden()) {
                        Image("shop_type_backgrounds")
                    }
                    NavigationLink(destination: ShopCoinsView()
                        .environmentObject(iapManager)
                        .navigationBarBackButtonHidden()) {
                        Image("shop_type_coins")
                    }
                }
            }
            .background(
                Image("shop_back")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height + 25)
                    .ignoresSafeArea()
            )
            .onAppear {
                balance = UserDefaults.standard.integer(forKey: "balance")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

#Preview {
    ShopProductTypes()
}
