//
//  ProductsViewModelType.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation
import Networking


typealias ProductsViewModelType = ProductsViewModelInput & ProductsViewModelOutput

//MARK: - Updates -
//
protocol ProductsViewModelInput { }

//MARK: - Actions -
//
protocol ProductsViewModelOutput {
    func bindToActivityIndicator(activityIndicatorStatus: @escaping (Bool) -> Void)
    func bindToErrorService(error: @escaping (Error) -> Void)
    func bindToIsFetchingDataNow(isFetching: @escaping (Bool) -> Void)
    func getProductItemCell(indexPath: IndexPath)-> Product
    func getNumberOfProductsCells() -> Int
    func bindToRelaodCollectionView(action: @escaping ()-> Void)
    func fetchProducts()
}
