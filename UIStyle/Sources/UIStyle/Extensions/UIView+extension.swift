//
//  File.swift
//  
//
//  Created by Semicolon on 15/12/2022.
//

import UIKit


//MARK: - shadow with view -
//
extension UIView {
    public func shadowWithView(shadowColor: UIColor = UIColor.blue, shadowOffset: CGSize = CGSize(width: 1, height: 1), shadowOpacity: Float = 0.5, shadowRadius: CGFloat = 1) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
}
