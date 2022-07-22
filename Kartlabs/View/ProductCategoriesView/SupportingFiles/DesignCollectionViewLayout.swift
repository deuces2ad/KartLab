//
//  DesignCollectionViewLayout.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import Foundation
import UIKit


class DesignCollectionViewLayout {
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            
            //items...
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
            item.contentInsets.trailing = 16
            item.contentInsets.bottom = 16
            
            //group...
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(500)), subitems: [item])
            
            //section...
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = 16
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: ProductCategories.containerHeaderId, alignment: .topLeading)
                
            ]
            return section
        }
    }
}
