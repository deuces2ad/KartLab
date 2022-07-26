//
//  ProductList.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import Foundation


struct ShopCategoriesList: Decodable {
    let data: [Product]
}

// MARK: - Datum
struct Product: Decodable ,Identifiable {
    let id = UUID()
    let category: String
    let items: [Item]
}

// MARK: - Item
struct Item: Decodable , Identifiable {
    let id = UUID()
    let itemName: String
    let itemPrice: Int
    let itemImage : String

    enum CodingKeys: String, CodingKey {
        case itemName = "item_Name"
        case itemPrice = "item_price"
        case itemImage = "item_image"
    }
    
    static func createItem (with  indexPath: IndexPath , from list : [Product] ) -> Item {
        
        let item = list[indexPath.section].items[indexPath.item]
        return item
    }
    static let dummyItem = Item(itemName: "Error", itemPrice: 123, itemImage: "meme")
}

extension ShopCategoriesList {
    static let dummyData = ShopCategoriesList(data: [Product.dummyProduct])
}
extension Product {
    static let dummyProduct = Product(category: "Error", items: [Item(itemName: "Error", itemPrice: 123, itemImage: "meme")])
}
