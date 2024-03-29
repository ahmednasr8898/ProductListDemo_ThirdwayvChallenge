//
//  PoductsListCollectionViewCell.swift
//  ProductsListDemo_ThirdwayvTask
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit
import UIStyle
import Domain

class PoductsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - constraints
    //
    @IBOutlet weak var heightOfProductImageViewConstraint: NSLayoutConstraint!
    
    //MARK: - outlets
    //
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var ProductDescriptionLabel: UILabel!
    
    //MARK: - variable
    //
    static let identifier = "PoductsCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PoductsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesignCell()
    }
    
    private func setupDesignCell() {
        subView.layer.borderWidth = 0.8
        subView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func Configuration(data: Domain.Product) {
        ConfigurationImageView(data: data)
        productPriceLabel.text = "\(data.price ?? 0) $"
        ProductDescriptionLabel.text = data.description
    }
    
    private func ConfigurationImageView(data: Domain.Product) {
        guard let url = data.image else { return }
        productImageView.downloaded(from: url)
        heightOfProductImageViewConstraint.constant = CGFloat(data.imageHeight ?? 0)
    }
}

