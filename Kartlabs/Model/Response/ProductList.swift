//
//  ProductList.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//


struct ProductList : Decodable {
    let data : [Product]
}
struct Product : Decodable {
    let category : String
    let items : [String]
}
