//
//  CategoryTitleView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import Foundation
import UIKit

class CategoryTitleView : UICollectionReusableView {

    
    lazy var headerLbl : UILabel = {
        let lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.backgroundColor = AppConfig.appThemeColor
        lbl.textColor = .black
        return lbl
    }()
    
    
    override init (frame :CGRect){
        super.init(frame: frame)
        addSubview(headerLbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
       super.layoutSubviews()
        headerLbl.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 30))
    }
}
