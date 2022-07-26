//
//  ProductListViewModel.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 24/07/22.
//

import Foundation
class ProductListViewModel : ObservableObject {
    @Published var items : [Item] = [Item.dummyItem]
}
