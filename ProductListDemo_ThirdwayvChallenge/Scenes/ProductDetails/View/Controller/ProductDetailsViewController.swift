//
//  ProductDetailsViewController.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    //MARK: - outlets -
    //
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    
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
        setProductImage()
        setProductPrice()
    }
}


//MARK: - set product image -
//
extension ProductDetailsViewController {
    private func setProductImage() {
        productImageView.downloaded(from: viewModel.getProductImageURl())
    }
}

//MARK: - set product price -
//
extension ProductDetailsViewController {
    private func setProductPrice() {
        productPriceLabel.text = viewModel.getProductPrice()
    }
}
