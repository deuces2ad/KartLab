//
//  ProductCategoriesContainer.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import Foundation
import SwiftUI

struct ProductCategoriesContainer : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return ProductCategories()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}
