//
//  File.swift
//  
//
//  Created by Semicolon on 15/12/2022.
//

import Foundation

public protocol ProductAPIProtocol {
    func fetchAllProducts(complection: @escaping (Result<ProductListModel?, Error>) -> Void)
}

public class ProductAPI: BaseAPI<ProductTarget>, ProductAPIProtocol {
    public override init() {}
    
}

extension ProductAPI {
    public func fetchAllProducts(complection: @escaping (Result<ProductListModel?, Error>) -> Void) {
        connectWithServer(target: .allProducts) { result in
            complection(result)
        }
    }
}
