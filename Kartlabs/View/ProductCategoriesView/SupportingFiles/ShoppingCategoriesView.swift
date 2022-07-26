//
//  ProductCategoriesContainer.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import Foundation
import SwiftUI

struct ShoppingCategoriesView : UIViewControllerRepresentable {

    @EnvironmentObject var tabbarVM : TabBarViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        return ShoppingCategoriesViewController(productListCategories: tabbarVM.productCategoriesList ?? ShopCategoriesList.dummyData)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}
