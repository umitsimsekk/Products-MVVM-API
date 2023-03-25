//
//  ProductViewModel.swift
//  ProductMVVM
//
//  Created by Ümit Şimşek on 25.03.2023.
//

import Foundation
final class ProductViewModel {
    var products : Array<Product> = []
    var eventHandler : ((_ event : Event) -> Void)?
    func fetchProduct(){
        self.eventHandler?(.loading)
        APIManager.shared.getAllProduct { result in
            self.eventHandler?(.stopLoading)
            switch result {
            case .success(let products):
                print(products)
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
}
extension ProductViewModel  {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
