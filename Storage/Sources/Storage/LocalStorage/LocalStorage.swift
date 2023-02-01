//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 01/01/2023.
//

import Foundation

//MARK: - local storage
//
public struct LocalStorage {
    public static let shared = LocalStorage()
    private init() {}
}


//MARK: - save list of product model
//
extension LocalStorage {
    public func saveListOfProductModel(ListOfProduct: [Storage.Product]?) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ListOfProduct) {
            UserDefaults.standard.set(encoded, forKey: "productModel")
        }
    }
    
    public func getListOfProductModel()-> [Storage.Product]? {
        let defaults = UserDefaults.standard
        guard let savedModel = defaults.object(forKey: "productModel") as? Data else {
            return nil
        }
        let decoder = JSONDecoder()
        guard let loadedModel = try? decoder.decode([Storage.Product].self, from: savedModel) else {
            return nil
        }
        return loadedModel
    }
}
