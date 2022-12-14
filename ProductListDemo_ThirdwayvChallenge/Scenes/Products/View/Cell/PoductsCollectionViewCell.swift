//
//  PoductsListCollectionViewCell.swift
//  ProductsListDemo_ThirdwayvTask
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit
import UIStyle

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
    
    func Configuration(data: ProductModel) {
        guard let url = data.image?.url else { return }
        productImageView.downloaded(from: url)
        heightOfProductImageViewConstraint.constant = CGFloat(data.image?.height ?? 0)
        productPriceLabel.text = "\(data.price ?? 0) $"
        ProductDescriptionLabel.text = data.productDescription
    }
}

