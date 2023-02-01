//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 01/01/2023.
//

import Foundation

public struct Product: Codable {
    public let id: Int?
    public let description: String?
    public let productPrice: Int?
    public let image: String?
    public let imageWidth: Int?
    public let imageHeight: Int?
    
    public init(id: Int?, description: String?, productPrice: Int?, image: String?, imageWidth: Int?, imageHeight: Int?) {
        self.id = id
        self.description = description
        self.productPrice = productPrice
        self.image = image
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
}
