//
//  File.swift
//  
//
//  Created by Semicolon on 15/12/2022.
//

import Foundation

public protocol ProductRepositoryProtocol {
    func fetchAllProducts(complection: @escaping (Result<ProductListModel?, Error>) -> Void)
}

public class ProductRepository: BaseAPI<ProductTarget>, ProductRepositoryProtocol {
    public override init() {}
    
}

extension ProductRepository {
    public func fetchAllProducts(complection: @escaping (Result<ProductListModel?, Error>) -> Void) {
        connectWithServer(target: .allProducts) { result in
            complection(result)
        }
    }
}
