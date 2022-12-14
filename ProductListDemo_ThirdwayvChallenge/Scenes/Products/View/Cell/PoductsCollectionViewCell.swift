//
//  PoductsListCollectionViewCell.swift
//  ProductsListDemo_ThirdwayvTask
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit

class PoductsCollectionViewCell: UICollectionViewCell {

    //MARK: - outlets
    //
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var heightOfProductImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var ProductDescriptionLabel: UILabel!
    
    //MARK: - variable
    //
    static let Identifier = "PoductsCollectionViewCell"
    static func Nib() -> UINib {
        return UINib(nibName: "PoductsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}