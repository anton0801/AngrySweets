import Foundation
import StoreKit

class IAPManager: ObservableObject {
    
    let productIDs: [String] = [
        "com.angrycandybonsweets.CandyBon.grade1coins",
        "com.angrycandybonsweets.CandyBon.grade2coins",
        "com.angrycandybonsweets.CandyBon.grade3coins"
    ]
    
    let idsData: [String: Int] = [
        "com.angrycandybonsweets.CandyBon.grade1coins": 500,
        "com.angrycandybonsweets.CandyBon.grade2coins": 3500,
        "com.angrycandybonsweets.CandyBon.grade3coins": 17500
    ]
    
    @Published var products: [Product] = []
    
    init() {
        Task {
            await loadProducts()
        }
    }
    
    func loadProducts() async {
        do {
            self.products = try await Product.products(for: productIDs)
                .sorted(by: { $0.price > $1.price })
        } catch {
            print("Failed to fetch products!")
        }
    }
    
    func buyProduct(_ product: Product, _ successCallback: @escaping () -> Void) async {
        do {
            let result = try await product.purchase()
            
            switch result {
            case let .success(.verified(transaction)):
                // Successful purhcase
                successCallback()
                await transaction.finish()
            case let .success(.unverified(_, error)):
                // Successful purchase but transaction/receipt can't be verified
                // Could be a jailbroken phone
                break
            case .pending:
                // Transaction waiting on SCA (Strong Customer Authentication) or
                // approval from Ask to Buy
                break
            case .userCancelled:
                break
            @unknown default:
                break
            }
        } catch {
        }
    }
    
    func restorePurchases() async {
        do {
            try await AppStore.sync()
        } catch {
            print(error)
        }
    }
}

