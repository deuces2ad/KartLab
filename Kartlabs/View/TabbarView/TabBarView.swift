//
//  TabbarView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct TabBarView: View {
    
    //MARK: - Properties
    @StateObject var viewRouter: ViewRouter
    @State var showPopUp = false
    
    //MARK: - Body
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                
                VStack {
                    Spacer()
                    switch viewRouter.currentPage {
                    case .home:
                        
                    ProductCategoriesContainer()
                            .navigationTitle("Home")
                            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
                        
                    case .productList:
                        ProductView()
                            .navigationTitle("Product List")
                            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
                        
                    case .giftRegistry:
                        GiftRegistryView()
                            .navigationTitle("Gift Registry")
                            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .productList, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "heart", tabName: "Product List")
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .giftRegistry, width: geometry.size.width/3, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Gift Registry")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/7.8)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}


struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: ViewRouter())
        
    }
}
