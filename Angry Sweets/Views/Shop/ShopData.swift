import Foundation

struct ShopDataItem {
    var previewImage: String
    var backgroundImage: String
    var name: String
    var firstText: String
    var price: Int
}

var shopDataItems = [
    ShopDataItem(previewImage: "cloudy_delight_valley", backgroundImage: "cloudy_delight_background", name: "Cloudy Delight", firstText: "They say there are the most beautiful clouds there....", price: 1000),
    ShopDataItem(previewImage: "sweet_dream_preview", backgroundImage: "sweet_dream_background", name: "Sweet Dream", firstText: "The sweetest dreams in the map's performance", price: 1500),
    ShopDataItem(previewImage: "space_valley_preview", backgroundImage: "space_valley_background", name: "Space Valley", firstText: "In a word just space:)", price: 2000),
    ShopDataItem(previewImage: "lollipop_era_preview", backgroundImage: "lollipop_era_background", name: "Lollipop Era", firstText: "It's time for the lollipop era.....", price: 3000)
]
