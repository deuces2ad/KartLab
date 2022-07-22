//
//  CategoryTitleView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import Foundation
import UIKit

class CategoryTitleView : UICollectionReusableView {
    let headerLbl = UILabel()
    
    override init (frame :CGRect){
        super.init(frame: frame)
        addSubview(headerLbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
       super.layoutSubviews()
        headerLbl.frame = bounds
    }
}
