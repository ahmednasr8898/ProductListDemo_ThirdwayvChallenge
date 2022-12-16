//
//  ProductDetailsViewController.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit
import UIStyle

class ProductDetailsViewController: UIViewController {

    //MARK: - Constraints -
    //
    @IBOutlet weak var heightOfProductImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightOfDescriptionViewConstraint: NSLayoutConstraint!
    
    //MARK: - outlets -
    //
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    //MARK: - variables -
    //
    let viewModel: ProductDetailsViewModelType
    weak var coordinator: ProductCoordinatorProtocol?
    
    //MARK: - init -
    //
    init(viewModel: ProductDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycle -
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesignForProductImageView()
        setupConstraintsForProductImageView()
        setProductImage()
        setProductDescription()
    }
}


//MARK: - setup Design For Product ImageView -
//
extension ProductDetailsViewController {
    private func setupDesignForProductImageView() {
        productImageView.layer.cornerRadius = 8
    }
}


//MARK: - setup constraint For Product ImageView -
//
extension ProductDetailsViewController {
    private func setupConstraintsForProductImageView() {
        heightOfProductImageViewConstraint.constant = view.frame.height * 0.6
    }
}


//MARK: - set product image -
//
extension ProductDetailsViewController {
    private func setProductImage() {
        productImageView.downloaded(from: viewModel.getProductImageURl())
    }
}


//MARK: - set product Description -
//
extension ProductDetailsViewController {
    private func setProductDescription() {
        productDescriptionLabel.text = viewModel.getProductDescription()
        setupHeightOfDescriptionView()
    }
    
    private func setupHeightOfDescriptionView() {
        productDescriptionLabel.sizeToFit()
        heightOfDescriptionViewConstraint.constant = productDescriptionLabel.frame.height + 40
    }
}
