//
//  ProductItemView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 22/07/22.
//

import SwiftUI

struct ProductItemView: View {
    
    //MARK: - Properties
     var itemName : String
     var itemPrice : String
    
    //MARK: - Body
    var body: some View {
        
        HStack(alignment: .center,spacing: 40){
            //Item Image...
            Image(systemName: "car")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.leading)
            //Item Info...
            VStack(alignment: .leading,spacing: 10){
                Text(itemName)
                Text(itemPrice)
                Button(action: {}) {
                    Text("Add To Cart")
                }
            }//VSTACK
            .padding(.vertical,5)
            Spacer()
        }//HSTACK
        .frame(maxWidth:.infinity)
        .background(Color.black.opacity(0.2))
        .padding(.horizontal)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(itemName: "LCD", itemPrice: "Rs 20,000")
    }
}
