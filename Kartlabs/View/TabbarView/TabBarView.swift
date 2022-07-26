//
//  TabbarView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct TabBarView: View {
    
    //MARK: - Properties
    @ObservedObject var viewRouter: ViewRouter
    @State var showPopUp = false
    @ObservedObject var tabbarViewModel : TabBarViewModel = TabBarViewModel()
   
    //MARK: - Body
    var body: some View {
        NavigationView{
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    switch viewRouter.currentPage {
                    case .home:
                        ShoppingCategoriesView()
                            .navigationTitle("Home")
                            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
                        
                    case .giftRegistry:
                        GiftRegistryView()
                            .navigationTitle("Gift Registry")
                            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
                    }//SWITCH CASE
                    Spacer()
                    //@Todo: This can be improved by CaseIterable
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/2, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .giftRegistry, width: geometry.size.width/2, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Gift Registry")
                    }//HSTACK
                    .frame(width: geometry.size.width, height: geometry.size.height/7.8)
                }//VSTACK
                .edgesIgnoringSafeArea(.bottom)
            }//GeometryReader
        }//NavigationView
        .environmentObject(tabbarViewModel)
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: ViewRouter())
        
    }
}
