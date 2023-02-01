//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 01/01/2023.
//

import Foundation

/// All product related use cases
///
public protocol ProductRepository {

    /// fetch all products at a page. Completes with products list or error if any.
    ///
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}
