//
//  CoffeeSize.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 12/09/2022.
//

import Foundation

enum CoffeeSize: String {
    case large = "large"
    case medium = "medium"
    case small = "small"
}

extension CoffeeSize {
    func getTotalPrice(price: Double, countCoffee: Double) -> Double{
        switch self{
            
        case .large:
            return price * 2.0 * countCoffee
        case .medium:
            return price * countCoffee
        case .small:
            return price / 2.0 * countCoffee
        }
    }
}
