//
//  File.swift
//  
//
//  Created by Semicolon on 15/12/2022.
//

import Foundation

public enum requestMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum Task {
    
    /// A request with no additional data.
    case requestPlain
    
    /// A requests body set with encoded parameters.
//    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

public protocol TargetType {
    
    var baseURL: String { get }
    
    var path: String { get }
    
    var method: requestMethod { get }
    
    var task: Task { get }
    
    var headers: [String: String]? { get }
}
