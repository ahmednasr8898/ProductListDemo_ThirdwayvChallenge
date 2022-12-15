//
//  File.swift
//  
//
//  Created by Semicolon on 15/12/2022.
//

import Foundation

public class BaseAPI<T: TargetType> {
    
    func connectWithServer<M: Decodable>(target: T, completion: @escaping (Result<M?, Error>) -> Void) {
        guard let url = URL(string: target.baseURL + target.path) else { return }
        let method = target.method.rawValue
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(M.self, from: data)
                    completion(.success(json))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

