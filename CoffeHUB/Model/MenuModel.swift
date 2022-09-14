//
//  MenuModel.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 13/09/2022.
//

import Foundation


// MARK: - MenuElement

struct MenuElement: Codable {
  let productID: Int
  let name: String
  let quantity, smallPrice, mediumPrice, largePrice: Int
  let image: String
  let imageSVG: String

  enum CodingKeys: String, CodingKey {
    case productID = "productId"
    case name, quantity
    case smallPrice = "small_price"
    case mediumPrice = "medium_price"
    case largePrice = "large_price"
    case image
    case imageSVG = "image_svg"
  }
}


