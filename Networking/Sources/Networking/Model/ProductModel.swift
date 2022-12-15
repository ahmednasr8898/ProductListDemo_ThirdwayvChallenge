//
//  File.swift
//  
//
//  Created by Semicolon on 15/12/2022.
//

import Foundation

// MARK: - ProductListModel
public struct ProductListModel: Codable {
    public let products: [Product]?
}

// MARK: - Product
public struct Product: Codable {
    public let id: Int?
    public let productDescription: String?
    public let image: productImage?
    public let price: Int?
}

// MARK: - productImage
public struct productImage: Codable {
    public let width, height: Int?
    public let url: String?
}
