//
//  ProductCategories.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

 enum Constants {
    static let  productCellId = "productCellId"
    static let  deadCellId = "deadCellId"
    static let containerHeaderId =  "containerHeaderId"
    static let productHeaderID  = "productHeaderID"
}

import SwiftUI

class ShoppingCategoriesViewController : UICollectionViewController {
    
    //MARK: - Properties
    var shopCategories : ShopCategoriesList?
    var productCategoriesViewModel : ProductCategoriesViewModel = ProductCategoriesViewModel()
    var productListViewModel : ProductListViewModel =  ProductListViewModel()
    
    //MARK: - LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    init(productListCategories : ShopCategoriesList){
        super.init(collectionViewLayout: DesignCollectionViewLayout.createLayout())
        self.shopCategories = productListCategories
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func configureCollectionView(){
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: Constants.productCellId)
        collectionView.register(ExploreMoreCell.self, forCellWithReuseIdentifier: Constants.deadCellId)
        collectionView.register(CategoryTitleView.self,
                                forSupplementaryViewOfKind: Constants.containerHeaderId,
                                withReuseIdentifier: Constants.productHeaderID)
    }
}

//MARK: - Delegate and DataSource Methods

extension ShoppingCategoriesViewController {
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.deadCellId, for: indexPath) as? ExploreMoreCell else{return UICollectionViewCell()}
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.productCellId, for: indexPath) as? ProductCell,
                  let productList  = self.shopCategories?.data  else {
                      return UICollectionViewCell()
                  }
            let itemName  = Item.createItem(with: indexPath, from: productList).itemName
            let itemPrice = Item.createItem(with: indexPath, from: productList).itemPrice
            let itemImage = Item.createItem(with: indexPath, from: productList).itemImage
            
            let info = ItemInfo(productImg: itemImage, productTitle: itemName, productPrice: itemPrice)
            cell.fillInfo(info: info)
            return cell
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return shopCategories?.data.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let productSlicedArray = shopCategories?.data[section].items[0..<3]
        return productSlicedArray!.count + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard  let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.productHeaderID, for: indexPath) as? CategoryTitleView else {
            return UICollectionReusableView()
        }
        header.headerLbl.text = shopCategories?.data[indexPath.section].category
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // layout custom end cell to explore more items
        if indexPath.item == 3 {
            Log.echo(key: "Shopp Category", text: "succesfully")
            let productListView = ProductListView()
            productListViewModel.items = (self.shopCategories?.data[indexPath.section].items)!
            
            let vc = UIHostingController(rootView: productListView.environmentObject(productListViewModel))
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }

        guard let item = self.shopCategories?.data[indexPath.section].items[indexPath.item] else {
            return
        }

        let selectedItemInfo = Item(itemName: item.itemName, itemPrice: item.itemPrice, itemImage: item.itemImage)
        let productView = ProductDetailView(item: selectedItemInfo)
        productCategoriesViewModel.selectedItemInfo = selectedItemInfo
        let productDetailViewController = UIHostingController(rootView: productView.environmentObject(productCategoriesViewModel))
        self.navigationController?.pushViewController(productDetailViewController, animated: true)
    }
}
      
//MARK: - Preview.

struct ProductCategory_Preview: PreviewProvider {
    
  static var previews: some View {
      ShoppingCategoriesView()
    }
}
