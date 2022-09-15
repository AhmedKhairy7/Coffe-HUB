//
//  CartData.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 15/09/2022.
//

import Foundation

class CartData {
    static let shared = CartData()
    var name: String?
    var price: String?
    var image: String?
    var countCoffee: String?
    var totalPrice: String?

    private init() { }
}
