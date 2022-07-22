//
//  ProductCategoriesContainer.swift
//  Kartlabs
//
//  Created by Abhishek dhiman on 21/07/22.
//

import Foundation
import SwiftUI

struct ProductCategoriesView : UIViewControllerRepresentable {

    @EnvironmentObject var tabbarVM : TabBarViewModel
    func makeUIViewController(context: Context) -> UIViewController {
        return ProductCategories(productListCategories: tabbarVM.productCategoriesList ?? ProductList.dummyData)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}
