//
//  TabBarViewModel.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 22/07/22.
//

import Foundation

class TabBarViewModel : ObservableObject {
    
    @Published var productCategoriesList : ProductList? = nil
    
    init(){
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
            productCategoriesList = try JSONDecoder().decode(ProductList.self, from: jsonData)
            
            if let results = productCategoriesList {
                Log.echo(key: "RESULT", text: results)
            }
        }
        catch let error{
            Log.echo(key: "ERROR", text: error.localizedDescription)
        }
    }
}
