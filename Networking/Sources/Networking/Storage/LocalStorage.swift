//
//  File.swift
//  
//
//  Created by Semicolon on 16/12/2022.
//

import Foundation

//MARK: - local storage
//
struct LocalStorage {
    static let shared = LocalStorage()
    private init() {}
}


//MARK: - save product list model
//
extension LocalStorage {
    func saveProductModel(productModel: ProductListModel?) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(productModel) {
            UserDefaults.standard.set(encoded, forKey: "productModel")
        }
    }
    
    func getProductModel()-> ProductListModel?{
        let defaults = UserDefaults.standard
        guard let savedModel = defaults.object(forKey: "productModel") as? Data else {
            return nil
        }
        let decoder = JSONDecoder()
        guard let loadedModel = try? decoder.decode(ProductListModel.self, from: savedModel) else {
            return nil
        }
        return loadedModel
    }
}
