//
//  ProductCategories.swift
//  Kartlabs
//
//  Created by Abhishek dhiman on 21/07/22.
//


import SwiftUI

class ProductCategories : UICollectionViewController {
    //MARK: - Properties

    static let  productCellId = "productCellId"
    static let containerHeaderId =  "containerHeaderId"
    static let productHeaderID  = "productHeaderID"
    var productsList : ProductList? = nil
    var productCategoriesViewModel : ProductCategoriesViewModel = ProductCategoriesViewModel()
    
    //MARK: - LifeCycle methods
    init(productListCategories : ProductList){
        super.init(collectionViewLayout: DesignCollectionViewLayout.createLayout())
        self.productsList = productListCategories
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
    }

    //MARK: - Methods
    
    func registerCollectionView(){
        //register product cell
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCategories.productCellId)
        //register Category header View
        collectionView.register(CategoryTitleView.self, forSupplementaryViewOfKind: ProductCategories.containerHeaderId, withReuseIdentifier: ProductCategories.productHeaderID)
    }
    
    
    //MARK: - Delegate and DataSource Methods
    
        //cellForItemAt...
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCategories.productCellId, for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        let productInfo = self.productsList?.data[indexPath.section].items[indexPath.item]
        if  let itemName  = productInfo?.itemName , let itemPrice = productInfo?.itemPrice {
            let info = ItemInfo(productImg: "", productTitle: itemName, productPrice: itemPrice)
            cell.fillInfo(info: info)
            return cell
        }
        return UICollectionViewCell()
      
    }
    
    //numberOfSections..
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return productsList?.data.count ?? 0
    }
    
    //numberOfItemsInSection..
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        (productsList?.data[section].items.count) ?? 0
    }
    
    //viewForSupplementaryElementOfKind...
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard  let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProductCategories.productHeaderID, for: indexPath) as? CategoryTitleView else {
            return UICollectionReusableView()
        }
        header.headerLbl.text = productsList?.data[indexPath.section].category
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = self.productsList?.data[indexPath.section].items[indexPath.item] else {
            return
        }
        
        let selectedItemInfo = ItemInfo(productImg: " ", productTitle: item.itemName, productPrice: item.itemPrice)
        
        let productView = ProductDetailView()
        productCategoriesViewModel.selectedItemInfo = selectedItemInfo
        let productDetailViewController = UIHostingController(rootView: productView.environmentObject(productCategoriesViewModel))
        self.navigationController?.pushViewController(productDetailViewController, animated: true)
  
    }
}
      
//MARK: - Preview.

struct ProductCategory_Preview: PreviewProvider {
    
  static var previews: some View {
      ProductCategoriesView()
    }
}
