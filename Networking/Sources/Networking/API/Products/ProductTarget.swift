//
//  File.swift
//  
//
//  Created by Semicolon on 15/12/2022.
//

import Foundation

public enum ProductTarget {
    case allProducts
}

extension ProductTarget: TargetType {
    public var baseURL: String {
        switch self {
        default:
            return EndPoints.baseURL.url
        }
    }
    
    public var path: String {
        switch self {
        case .allProducts:
            return "ProductListDB/db"
        }
    }
    
    public var method: requestMethod {
        switch self {
        case .allProducts:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .allProducts:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .allProducts:
            return [:]
        }
    }
}
