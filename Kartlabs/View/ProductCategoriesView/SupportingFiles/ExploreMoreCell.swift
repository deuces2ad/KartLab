//
//  ExploreMoreCell.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 24/07/22.
//

import Foundation
import UIKit

class ExploreMoreCell : UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(moreLbl)
        self.moreLbl.frame = bounds
        
    }
    
    lazy var moreLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Explore more"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = AppConfig.appThemeColor
        return lbl
    }()
    
    
}
