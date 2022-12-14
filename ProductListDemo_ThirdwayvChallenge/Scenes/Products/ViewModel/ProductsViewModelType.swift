//
//  ProductsViewModelType.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation

typealias ProductsViewModelType = ProductsViewModelInput & ProductsViewModelOutput

//MARK: - Updates
//
protocol ProductsViewModelInput {
    
}

//MARK: - Actions
//
protocol ProductsViewModelOutput {
    func bindToActivityIndicator(status: @escaping (Bool) -> Void)
    func bindToErrorResponse(error: @escaping (Error) -> Void)
    func getProductItemCell(indexPath: IndexPath)-> ProductModel
    func getNumberOfProductsCells() -> Int
    func bindToRelaodCollectionView(action: @escaping ()-> Void)
    func fetchProducts()
}
