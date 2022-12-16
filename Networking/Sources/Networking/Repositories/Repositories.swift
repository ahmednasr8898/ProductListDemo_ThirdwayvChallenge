//
//  File.swift
//  
//
//  Created by Semicolon on 16/12/2022.
//

import Foundation

public protocol RepositoriesProtocol {
    func fetchProducts(complection: @escaping (ProductListModel?, Error?)-> Void)
}

public class Repositories {
    private let productsRepository: ProductAPIProtocol = ProductAPI()
    public init() {}
}

//MARK: - fetch all products
//
extension Repositories: RepositoriesProtocol {
    public func fetchProducts(complection: @escaping (ProductListModel?, Error?)-> Void) {
        productsRepository.fetchAllProducts { result in
            
            switch result {
            case .success(let data):
                LocalStorage.shared.saveProductModel(productModel: data)
                complection(data, nil)
            case .failure(let error):
                if let productCashed = LocalStorage.shared.getProductModel() {
                    complection(productCashed, nil)
                } else {
                    complection(nil, error)
                }
            }
        }
    }
}
