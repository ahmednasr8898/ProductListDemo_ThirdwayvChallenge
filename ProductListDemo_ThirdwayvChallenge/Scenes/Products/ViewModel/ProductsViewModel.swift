//
//  ProductsViewModel.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation
import Networking

class ProductsViewModel {
    private let productsRepository: ProductRepositoryProtocol = ProductRepository()
    
    private var activityIndicatorStatus: (Bool) -> Void = { _ in}
    private var errorService: (Error) -> Void = { _ in }
    private var isFetchingDataNow: (Bool) -> Void = { _ in }
    private var bindToReloadCollectionViewClosure: (() -> Void)?
    private var products: [Product] = [] {
        didSet {
            bindToReloadCollectionViewClosure?()
        }
    }
    
    init() {
        fetchProducts()
    }
}

//MARK: - ProductsViewModel Input -
//
extension ProductsViewModel: ProductsViewModelInput {
    
}

//MARK: - ProductsViewModel Output -
//
extension ProductsViewModel: ProductsViewModelOutput {
    func bindToActivityIndicator(activityIndicatorStatus: @escaping (Bool) -> Void) {
        self.activityIndicatorStatus = activityIndicatorStatus
    }
    
    func bindToErrorService(error: @escaping (Error) -> Void) {
        errorService = error
    }
    
    func bindToIsFetchingDataNow(isFetching: @escaping (Bool) -> Void) {
        isFetchingDataNow = isFetching
    }
    
    func getProductItemCell(indexPath: IndexPath) -> Product {
        return products[indexPath.row]
    }
    
    func getNumberOfProductsCells() -> Int {
        return products.count
    }
    
    func bindToRelaodCollectionView(action: @escaping () -> Void) {
        bindToReloadCollectionViewClosure = action
    }
    
    func fetchProducts() {
        isFetchingDataNow(true)
        
        productsRepository.fetchAllProducts { [weak self] result in
            guard let self = self else { return }
            self.activityIndicatorStatus(true)
            
            switch result {
            case .success(let data):
                guard let arrOfProduct = data?.products else { return }
                self.products.append(contentsOf: arrOfProduct)
            case .failure(let error):
                self.errorService(error)
            }
            self.activityIndicatorStatus(false)
            self.isFetchingDataNow(false)
        }
    }
}

