//
//  ProductListViewController.swift
//  Products MVVM
//
//  Created by mohammadreza on 4/16/1402 AP.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()


        
    }
    


}
extension ProductListViewController{
    func configuration(){
        initViewModel()
        observeEvent()
    }
    func initViewModel(){
        viewModel.fetchProduct()
        
    }
    //data binding event observe
    func observeEvent(){
        viewModel.eventHAndler = { [weak self] event in
            guard let self else { return}
            
            switch event {
            case .loading:
                print("Product Loading...")
            case .stopLoading:
                print("Product StopLoading...")
            case .dataLoaded:
                print("Product DataLoading...")

                print(self.viewModel.products)
            case .error(let error):
                print (error)
            }
            
        }
        
    }
}
