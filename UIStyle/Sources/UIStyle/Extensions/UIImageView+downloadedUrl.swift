//
//  File.swift
//  
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit

//MARK: - load image form url -
//
extension UIImageView {
    func downloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    /// load url into imag
    /// - Parameters:
    ///   - url: string url form serveice
    ///   - usage: imageview.downloaded(your_image_url)
    public func downloaded(from link: String) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url)
    }
}
