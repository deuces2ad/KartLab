//
//  ProductDetailView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var productCategoriesViewModel : ProductCategoriesViewModel
    
    var body: some View {
        VStack{
            ZStack{
                Color.blue
                Text(productCategoriesViewModel.selectedItemInfo.productTitle)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
