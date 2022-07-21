//
//  ProductView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct ProductView: View {
    @State var isLinkActive : Bool = false
    var body: some View {
        VStack{
            ZStack{
                Color.yellow
                Text("Product View")
            }
         
            Button(action: {
                isLinkActive.toggle()
            }) {
                Text("Navigate")
            }
            NavigationLink(destination: ProductDetailView(), isActive: $isLinkActive){
                EmptyView()
            }
           
        }
       
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
