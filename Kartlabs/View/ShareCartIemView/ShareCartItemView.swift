//
//  ShareCartItemView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 26/07/22.
//

import Foundation
import UIKit
import SwiftUI

struct ShareCartItemViewController : UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIActivityViewController
    var items :[Any] = []
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
   
    
    
    
}
