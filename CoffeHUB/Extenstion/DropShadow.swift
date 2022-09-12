//
//  DropShadow.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 12/09/2022.
//

import Foundation
import UIKit


extension UIView {
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.2
    layer.shadowOffset = .zero
    layer.shadowRadius = 5
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
