//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 01/01/2023.
//

import Foundation
import Networking
import Storage
import Domain

/// convert networking product to domain product
///
extension Networking.Product {
    func toDomain() -> Domain.Product {
        return Domain.Product(id: id, description: productDescription, price: price, image: image?.url, imageWidth: image?.width, imageHeight: image?.height)
    }
}

/// convert networking product to storage product
///
extension Networking.Product {
    func toStorage() -> Storage.Product {
        return Storage.Product(id: id, description: productDescription, productPrice: price, image: image?.url, imageWidth: image?.width, imageHeight: image?.height)
    }
}

/// convert storage product to domain product
///
extension Storage.Product {
    func toDomain() -> Domain.Product  {
        return Domain.Product(id: id, description: description, price: productPrice, image: image, imageWidth: imageWidth, imageHeight: imageHeight)
    }
}


