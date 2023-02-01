//
//  ProductDetailsViewModel.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation
import Domain

class ProductDetailsViewModel {
    
    let product: Product
    
    init(product: Domain.Product) {
        self.product = product
    }
}


//MARK: - ProductDetailsViewModel Input -
//
extension ProductDetailsViewModel: ProductDetailsViewModelInput {
    
}

//MARK: - ProductDetailsViewModel Output -
//
extension ProductDetailsViewModel: ProductDetailsViewModelOutput {
    func getProductImageURl() -> String {
        guard let url = product.image else { return "" }
        return url
    }
    
    func getProductDescription() -> String {
        guard let description = product.description else { return "" }
        return description
    }
}
