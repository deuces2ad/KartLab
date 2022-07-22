//
//  ProductView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct ProductView: View {
    @State var isLinkActive : Bool = false
    @State var searchableTxt : String = ""
    @EnvironmentObject var tabbarVM : TabBarViewModel
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 25, height: 25)
                TextField("Search", text: $searchableTxt)
                    
            }//HSTACK
            .padding(.horizontal)
            
            ScrollView{
                ForEach(tabbarVM.productCategoriesList?.data ?? [Product.dummyProduct]){ categories in
                    ForEach(categories.items){ item in
//                        Text(item.itemName)
                        ProductItemView(itemName: item.itemName, itemPrice: "Rs \(item.itemPrice)")
                    }
                }//OuterForEach to extract sections...
            }//ScrollView
        }//VSTACK
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
