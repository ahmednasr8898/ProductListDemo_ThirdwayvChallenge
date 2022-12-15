//
//  File.swift
//  
//
//  Created by Semicolon on 15/12/2022.
//

import Foundation

enum EndPoints: String {
    case baseURL = "https://my-json-server.typicode.com/ahmednasr8898/"
    
    var url: String {
        return self.rawValue
    }
}
