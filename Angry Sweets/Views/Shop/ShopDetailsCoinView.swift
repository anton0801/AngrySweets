import SwiftUI

struct ShopDetailsCoinView: View {
    
    var shopItem: ShopDataItem
    
    @Environment(\.presentationMode) var pres
    
    @State var balance = 0
    
    @State var buyErrorAlert = false
    
    @EnvironmentObject var iapManager: IAPManager
    
    var body: some View {
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
                ZStack {
                    Image("value_bg")
                        .resizable()
                        .frame(width: 250, height: 150)
                    Text(shopItem.name)
                        .font(.custom("Lemon-Regular", size: 16))
                        .foregroundColor(.white)
                }
                Image(shopItem.previewImage)
                    .resizable()
                    .frame(width: 250, height: 150)
                    .cornerRadius(32)
                ZStack {
                    Image("value_bg")
                        .resizable()
                        .frame(width: 250, height: 150)
                    Text(shopItem.firstText)
                        .font(.custom("Lemon-Regular", size: 16))
                        .foregroundColor(.white)
                }
                .frame(width: 250, height: 150)
            }
            
            if let product = iapManager.products.filter({ $0.id == shopItem.extra! }).first {
                Button {
                    Task {
                        await iapManager.buyProduct(product) {
                            DispatchQueue.main.async {
                                self.balance += iapManager.idsData[product.id]!
                            }
                        }
                    }
                } label: {
                    ZStack {
                        Image("btn_bg")
                        Text("\(product.displayPrice)")
                            .font(.custom("Lemon-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding(.leading)
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
        .alert(isPresented: $buyErrorAlert) {
            Alert(title: Text("Buy error!"), message: Text("Purchases error! You don't have enought coins to buy \(shopItem.name)!"))
        }
    }
    
}

#Preview {
    ShopDetailsCoinView(shopItem: shopDataCoins[0])
        .environmentObject(IAPManager())
}
