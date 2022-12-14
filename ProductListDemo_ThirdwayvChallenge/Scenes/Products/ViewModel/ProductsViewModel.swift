//
//  ProductsViewModel.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation


class ProductsViewModel {
    private var activityIndicatorStatus: (Bool) -> Void = { _ in}
    private var errorResponse: (Error) -> Void = { _ in }
    
    private var bindToReloadCollectionViewClosure: (() -> Void)?
    private var products: [ProductModel] = [] {
        didSet {
            bindToReloadCollectionViewClosure?()
        }
    }
    
    init() {
        fetchProducts()
    }
}

//MARK: - ProductsViewModel Input
//
extension ProductsViewModel: ProductsViewModelInput {
    
}

//MARK: - ProductsViewModel Output
//
extension ProductsViewModel: ProductsViewModelOutput {
    func bindToActivityIndicator(status: @escaping (Bool) -> Void) {
        activityIndicatorStatus = status
    }
    
    func bindToErrorResponse(error: @escaping (Error) -> Void) {
        errorResponse = error
    }
    
    func getProductItemCell(indexPath: IndexPath) -> ProductModel {
        return products[indexPath.row]
    }
    
    func getNumberOfProductsCells() -> Int {
        return products.count
    }
    
    func bindToRelaodCollectionView(action: @escaping () -> Void) {
        bindToReloadCollectionViewClosure = action
    }
    
    func fetchProducts() {
        activityIndicatorStatus(true)
        guard let productsURL = Bundle.main.url(forResource: "products", withExtension: "json") else { return }
        activityIndicatorStatus(false)
        do {
            let data = try Data(contentsOf: productsURL)
            let productsData = try JSONDecoder().decode([ProductModel].self, from: data)
            products = productsData
        } catch let error {
            errorResponse(error)
        }
    }
}

