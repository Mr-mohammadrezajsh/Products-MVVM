//
//  API.swift
//  Products MVVM
//
//  Created by mohammadreza on 4/15/1402 AP.
//

import UIKit
//Singleton Design Pattern
enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case Network(Error?)
}
typealias Handler = (Result<[Product], DataError>) -> Void

final class APIMAnager{
    static let shared = APIMAnager()
    private init(){}

    func fetchProducts(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.productURL) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data, error == nil  else {
                completion(.failure(.invalidData))
                return
                
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let product = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(product))

            }catch{
                completion(.failure(.Network(error)))

            }
            
            
        }.resume()
            
        
    }
}
/*
class A: APIMAnager {
    override func temp(){
        
    }
    func configuration(){
        let manager = APIMAnager()
        APIMAnager.shared.temp()
    }
 */

