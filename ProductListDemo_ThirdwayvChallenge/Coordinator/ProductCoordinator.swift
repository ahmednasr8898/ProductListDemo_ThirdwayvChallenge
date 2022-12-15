//
//  ProductCoordinator.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit
import Networking

protocol ProductCoordinatorProtocol: AnyObject {
    func showProductList()
    func showProductDetails(product: Product)
}


class ProductCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        showProductList()
    }
}

extension ProductCoordinator: ProductCoordinatorProtocol {
    func showProductList() {
        let viewModel = ProductsViewModel()
        let productsViewController = ProductsViewController(viewModel: viewModel)
        productsViewController.coordinator = self
        show(viewController: productsViewController)
    }
    
    func showProductDetails(product: Product) {
        let viewModel = ProductDetailsViewModel(product: product)
        let productDetailsViewController = ProductDetailsViewController(viewModel: viewModel)
        productDetailsViewController.coordinator = self
        show(viewController: productDetailsViewController)
    }
}
