//
//  ProductDetailView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct ProductDetailView: View {
   
    //MARK: - Properties
    var item : Item
    @EnvironmentObject var tabBarViewModel :TabBarViewModel
    
    //MARK: - Body
    var body: some View {
        
        VStack{
            Image(item.itemImage)
                .resizable()
                .frame(width: screenSize.width, height: 200)
                .aspectRatio(contentMode: .fit)
        
            Text("You'll pay Dh." + "\(item.itemPrice)" + " for the" + " \(item.itemName) ")
                .font(.custom("system", fixedSize: 25))
                .multilineTextAlignment(.center)
            
            Button(action: {
                tabBarViewModel.cartItemsList.append(item)
            }) {
                Text("Add to Cart")
                    .font(.custom("system", fixedSize: 25))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 50)
                    .background(Color(AppConfig.appColor))
            }
            Spacer()
        }//VSTACK
        .navigationBarTitle(item.itemName)
    }
    
    var screenSize : CGRect {
        UIScreen.main.bounds
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(item: Item(itemName: "TV", itemPrice: 13, itemImage: "meme"))
    }
}
