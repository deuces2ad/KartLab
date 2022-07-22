//
//  ViewRouter.swift
//  Kartlabs
//
//  Created by Abhishek dhiman on 21/07/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
}


enum Page {
    case home
    case productList
    case giftRegistry
}
