//
//  ProductsViewConfigurator.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation


//MARK: - factory pattern
//
class ProductsViewConfigurator {
    static func getProductsViewController() -> ProductsViewController {
        let viewModel = ProductsViewModel()
        let productsViewController = ProductsViewController(viewModel: viewModel)
        return productsViewController
    }
}
