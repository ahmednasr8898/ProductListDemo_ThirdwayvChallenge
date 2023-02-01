//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 01/01/2023.
//

import Foundation

///product model
///
public struct Product {
    public let id: Int?
    public let description: String?
    public let price: Int?
    public let image: String?
    public let imageWidth: Int?
    public let imageHeight: Int?
    
    public init(id: Int?, description: String?, price: Int?, image: String?, imageWidth: Int?, imageHeight: Int?) {
        self.id = id
        self.description = description
        self.price = price
        self.image = image
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
}

