//
//  ProductList.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import Foundation


//struct ProductList : Decodable {
//    let data : [Product]
//}
//struct Product : Decodable ,Identifiable {
//    let id = UUID()
//    let category : String
//    let items : [String]
//}


struct ProductList: Decodable {
    let data: [Product]
}

// MARK: - Datum
struct Product: Decodable ,Identifiable {
    let id = UUID()
    let category: String
    let items: [Item]
}

// MARK: - Item
struct Item: Decodable ,Identifiable {
    let id = UUID()
    let itemName: String
    let itemPrice: Int

    enum CodingKeys: String, CodingKey {
        case itemName = "item_Name"
        case itemPrice = "item_price"
    }
}

extension ProductList {
    static let dummyData = ProductList(data: [Product.dummyProduct])
}
extension Product {
    static let dummyProduct = Product(category: "Error", items: [Item(itemName: "Error", itemPrice: 123)])
}
