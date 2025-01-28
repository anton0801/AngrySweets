import SwiftUI

struct ShopCoinsView: View {
    @Environment(\.presentationMode) var pres
    
    @State var balance = 0
    
    @EnvironmentObject var iapManager: IAPManager
    
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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(shopDataCoins, id: \.previewImage) { shopDataItem in
                            NavigationLink(destination: ShopDetailsCoinView(shopItem: shopDataItem)
                                .environmentObject(iapManager)
                                .navigationBarBackButtonHidden()) {
                                    Image(shopDataItem.previewImage)
                                }
                        }
                    }
                }
            }
            .background(
                Image("shop_back")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height + 25)
                    .ignoresSafeArea()
                    .opacity(0.7)
            )
            .onAppear {
                balance = UserDefaults.standard.integer(forKey: "balance")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ShopCoinsView()
        .environmentObject(IAPManager())
}
