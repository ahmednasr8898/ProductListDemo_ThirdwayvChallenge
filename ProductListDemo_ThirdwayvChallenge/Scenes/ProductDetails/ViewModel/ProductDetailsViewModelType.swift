//
//  ProductDetailsViewModelType.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation


typealias ProductDetailsViewModelType = ProductDetailsViewModelInput & ProductDetailsViewModelOutput

//MARK: - Updates -
//
protocol  ProductDetailsViewModelInput { }

//MARK: - Actions -
//
protocol  ProductDetailsViewModelOutput {
    func getProductImageURl() -> String
    func getProductDescription() -> String
}
