//
//  ProductModel.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable {
    let id: Int?
    let productDescription: String?
    let image: ProductImage?
    let price: Int?
}

// MARK: - ProductImage
struct ProductImage: Codable {
    let width, height: Int?
    let url: String?
}
