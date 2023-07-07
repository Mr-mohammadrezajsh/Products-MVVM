//
//  Product.swift
//  Products MVVM
//
//  Created by mohammadreza on 4/15/1402 AP.
//

import Foundation
//json object
struct Product: Decodable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rate
}
//json object
struct Rate: Decodable {
    let rate: Float
    let count: Int
}
