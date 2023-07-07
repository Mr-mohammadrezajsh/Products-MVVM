//
//  ProductViewModel.swift
//  Products MVVM
//
//  Created by mohammadreza on 4/16/1402 AP.
//

import Foundation

final class ProductViewModel{
    
    var products: [Product] = []
    var eventHAndler: ((_ event: Event) -> Void)?
    
    
    func fetchProduct(){
        self.eventHAndler?(.loading)

        APIMAnager.shared.fetchProducts{ response in
            self.eventHAndler?(.stopLoading)

            switch response {
            case .success(let products):
                self.products = products
                self.eventHAndler?(.dataLoaded)
            case .failure(let error):
                self.eventHAndler?(.error(error))
            }
            
        }
    }
}

extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
