//
//  CornerRadius.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 12/09/2022.
//

import Foundation
import UIKit
extension UIImageView {
  func cornerRadius() {
    self.layer.cornerRadius = self.frame.size.width / 2
    self.clipsToBounds = true
  }

}


