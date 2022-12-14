//
//  SystemDesign+Colors.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit

//MARK: - custom app colors
//
extension SystemDesign {
    enum AppColors: String {
        case primary
        
        var color: UIColor {
            return UIColor(named: self.rawValue) ?? UIColor()
        }
    }
}
