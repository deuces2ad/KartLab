//
//  ProductCategories.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//


import SwiftUI

class ProductCategories : UICollectionViewController {
    //MARK: - Properties

    static let  cellId = "cellid"
    static let containerHeaderId =  "containerHeaderId"
    static let headerID  = "headerID"
    
    var productsList : ProductList? = nil
    
    //MARK: - LifeCycle methods
    init(){
        super.init(collectionViewLayout: DesignCollectionViewLayout.createLayout())
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
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCategories.cellId)
        collectionView.register(CategoryTitleView.self, forSupplementaryViewOfKind: ProductCategories.containerHeaderId, withReuseIdentifier: ProductCategories.headerID)
        parseJson()
    }
    
    func parseJson(){
        guard let path = Bundle.main.path(forResource: "product", ofType: "json") else {
            Log.echo(key: "JSON", text: "failed loading JSON")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let jsonData = try Data(contentsOf: url)
            productsList = try JSONDecoder().decode(ProductList.self, from: jsonData)
            
            if let results = productsList {
                Log.echo(key: "RESULT", text: results)
            }
        }
        catch let error{
            Log.echo(key: "ERROR", text: error.localizedDescription)
        }
    }
    
    //MARK: - Delegate and DataSource Methods
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCategories.cellId, for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        let productName = self.productsList?.data[indexPath.section].items[indexPath.item] ?? ""
        
        let info = ItemInfo(productImg: "", productTitle: productName)
        cell.fillInfo(info: info)
        return cell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return productsList?.data.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        (productsList?.data[section].items.count) ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard  let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProductCategories.headerID, for: indexPath) as? CategoryTitleView else {
            return UICollectionReusableView()
        }
        header.headerLbl.text = productsList?.data[indexPath.section].category
        return header
    }
}
      
//MARK: - Preview.

struct ProductCategory_Preview: PreviewProvider {
  static var previews: some View {
      ProductCategoriesContainer()
    }
}
