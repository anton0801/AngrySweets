import SwiftUI

// измененеи размера node (рогатки)
//func updateHookLength(to yPosition: CGFloat) {
//        let adjustedHeight = size.height - yPosition - 100
//        hook.size.height = max(50, min(size.height - 200, adjustedHeight))
//        hook.position.y = size.height - hook.size.height / 2 - 100
//    }

struct ContentView: View {
    
    @State var loadingCurrent = 0
    var loadingImagesRes = [
        "loading_0",
        "loading_1",
        "loading_2",
        "loading_3",
        "loading_4",
        "loading_5",
        "loading_6",
        "loading_7",
        "loading_8"
    ]
    @State var loadingCompleted = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(loadingImagesRes[loadingCurrent])
                    .resizable()
                    .frame(width: 250, height: 25)
                
                NavigationLink(destination: MainMenuAngry()
                    .navigationBarBackButtonHidden(), isActive: $loadingCompleted) {
                    
                }
            }
            .background(
                Image("loading_back")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height + 25)
                    .ignoresSafeArea()
            )
            .onAppear {
                startLoading()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func startLoading() {
        if loadingCurrent < loadingImagesRes.count - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.loadingCurrent += 1
                self.startLoading()
            }
        } else {
            loadingCompleted = true
        }
    }
    
}

#Preview {
    ContentView()
}
