//
//  ProductView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct ProductListView: View {
    
    //MARK: - Properties
    @State var searchableTxt : String = ""
    @EnvironmentObject var productListViewModel : ProductListViewModel
    @State var navigate = false
  
    //MARK: - Body
    var body: some View {
        VStack{
            List(itemsResult){ item in
                NavigationLink(destination: ProductDetailView(item: item)) {
                    HStack{
                        Image(item.itemImage)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                        Text(item.itemName)
                    }
                   
                }
            }//LIST
            .searchable(text: $searchableTxt)
        }//VSTACK
    }
    
    var itemsResult : [Item] {
        let lcItems = self.productListViewModel.items.map { item in
            item
        }
        return searchableTxt == "" ? lcItems : lcItems.filter {
            $0.itemName.contains(searchableTxt)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
