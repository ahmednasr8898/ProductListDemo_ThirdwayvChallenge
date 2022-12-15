//
//  ProductDetailsViewModel.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import Foundation
import Networking

class ProductDetailsViewModel {
    
    let product: Product
    
    init(product: Product) {
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
        guard let url = product.image?.url else { return "" }
        return url
    }
    
    func getProductPrice() -> String {
        guard let price = product.price else { return "" }
        let priceStr = String(price)
        return priceStr + "$"
    }
}
