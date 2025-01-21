import SwiftUI

struct ShopDetailsItemView: View {
    
    var shopItem: ShopDataItem
    
    @Environment(\.presentationMode) var pres
    
    @State var balance = 0
    
    @State var buyErrorAlert = false
    
    @State var backgroundHave = false
    @State var selectedBack = ""
    
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
                Image(shopItem.backgroundImage)
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
            
            if selectedBack == shopItem.backgroundImage {
                Text("SELECTED")
                    .font(.custom("Lemon-Regular", size: 20))
                    .foregroundColor(.white)
            } else {
                if backgroundHave {
                    Button {
                        selectedBack = shopItem.backgroundImage
                    } label: {
                        Image("you_have")
                    }
                } else {
                    Button {
                        if balance >= shopItem.price {
                            balance -= shopItem.price
                            backgroundHave = true
                        } else {
                            buyErrorAlert = true
                        }
                    } label: {
                        ZStack {
                            Image("buy_btn_bg")
                            Text("\(shopItem.price)")
                                .font(.custom("Lemon-Regular", size: 20))
                                .foregroundColor(.white)
                                .padding(.leading)
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
        .alert(isPresented: $buyErrorAlert) {
            Alert(title: Text("Buy error!"), message: Text("Purchases error! You don't have enought coins to buy \(shopItem.name)!"))
        }
        .onAppear {
            backgroundHave = UserDefaults.standard.bool(forKey: "bought_\(shopItem.backgroundImage)")
            selectedBack = UserDefaults.standard.string(forKey: "selected_back") ?? "default_back"
        }
        .onChange(of: backgroundHave) { newBack in
            UserDefaults.standard.set(newBack, forKey: "bought_\(shopItem.backgroundImage)")
        }
        .onChange(of: selectedBack) { newBack in
            UserDefaults.standard.set(newBack, forKey: "default_back")
        }
    }
    
}

#Preview {
    ShopDetailsItemView(shopItem: shopDataItems[0])
}
