//
//  GiftRegistryView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct GiftRegistryView: View {
    //MARK: - Properties
    @State var sheet = false
    @State var sharedItems : [Any] = []
    @EnvironmentObject var tabBarViewModel : TabBarViewModel
    
    
    //MARK: - Body
    var body: some View {
        VStack{
            if let items = tabBarViewModel.cartItemsList{
                List{
                    ForEach(items){ item in
                        HStack{
                            Text(item.itemName)
                            Spacer()
                            Text(" Dh. \(item.itemPrice)")
                        }//HSTACK
                    }//ForEach
                    .onDelete(perform: deleteItemFromCartFor(id:))
                }//List
                HStack{
                    Text("Total Amount: \(totalCheckoutAmount)")
                    Button(action: {
                        sharedItems.append(UIImage(named: "meme")!)
                        sheet.toggle()
                    }) {
                        Text("Share Items with friend")
                        
                    }
                }
                .sheet(isPresented: $sheet) {
                    ShareCartItemViewController()
                }
                
            }
        }
    }
   
    func deleteItemFromCartFor(id offsets: IndexSet) {
        tabBarViewModel.cartItemsList.remove(atOffsets: offsets)
    }

    var totalCheckoutAmount : Int {
        let items = tabBarViewModel.cartItemsList.map{ $0.itemPrice}
        return items.reduce(0){$0 + $1}
    }
}

struct GiftRegistryView_Previews: PreviewProvider {
    static var previews: some View {
        GiftRegistryView()
    }
}
