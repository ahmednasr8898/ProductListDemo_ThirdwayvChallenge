//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 01/01/2023.
//

import Foundation
import Domain
import Networking
import Storage

/// Implementation of `Domain.ProductRepository`
///
public struct ProductRepository: Domain.ProductRepository {
    
    public init() {}
    private let api: ProductAPIProtocol = ProductAPI()
    
    public func fetchProducts(completion: @escaping (Result<[Domain.Product], Error>) -> Void) {
        api.fetchProducts { result in
            switch result {
            case .success(let list):
                guard let list = list else { return }
                let domainList = list.map { $0.toDomain() }
                let storageList = list.map { $0.toStorage() }
                LocalStorage.shared.saveListOfProductModel(ListOfProduct: storageList)
                completion(.success(domainList))
                
            case .failure(let error):
                if let productCashed = LocalStorage.shared.getListOfProductModel() {
                    let storageList = productCashed.map {  $0.toDomain() }
                    completion(.success(storageList))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}
