//
//  ProductCell.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import Foundation
import UIKit

class ProductCell : UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadUIViews()
        layoutUI()
        
    }
    
    //MARK: - Propterties
    
    lazy var productImage : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .red
        return iv
    }()
    
    lazy var productTitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lbl.text = "Jeans"
        lbl.textAlignment = .center
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    
    //MARK: - Methods
    
    func fillInfo ( info : ItemInfo){
//        self.productImage.image = info.productImg
        self.productTitleLbl.text = info.productTitle
    }
    
    func loadUIViews(){
        addSubview(productImage)
        addSubview(productTitleLbl)
    }
    
    func layoutUI(){
        productImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,size: .init(width: 0, height: self.frame.height * 0.80))
        productTitleLbl.anchor(top: productImage.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
}


struct ItemInfo {
    let productImg : String
    let productTitle : String
    let productPrice : Int
    static let dummyItem = ItemInfo(productImg: "", productTitle: "", productPrice: 0)
}
