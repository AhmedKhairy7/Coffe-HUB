//
//  CartTableViewCell.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
  @IBOutlet weak var quantityLabel: UILabel!
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var cartName: UILabel!
  @IBOutlet weak var backGroundView: UIView!
  @IBOutlet weak var minusButton: UIButton!
  @IBOutlet weak var cartImage: UIImageView!
  @IBOutlet weak var priceLabel: UILabel!
  var delegate: CartDataProtocol!
  override func awakeFromNib() {
    super.awakeFromNib()

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    cornerRaduis(myView: backGroundView)

  }

  func cornerRaduis(myView:UIView) {
    myView.layer.cornerRadius = 10
  }
  @IBAction func minusButton(_ sender: UIButton) {
      let count = CartData.shared.countCoffee ?? "0"
      let total = CartData.shared.totalPrice ?? "0.0"
      let updateCount = Int(count)! - 1
      quantityLabel.text = "\(updateCount)"
      delegate.add(count: "\(updateCount)", total: total)
      
  }
  @IBAction func plusButton(_ sender: UIButton) {
      let count = CartData.shared.countCoffee ?? "0"
      let total = CartData.shared.totalPrice ?? "0.0"
      let updateCount = Int(count)! + 1
      quantityLabel.text = "\(updateCount)"
      delegate.sub(count: "\(updateCount)", total: total)
  }
}
protocol CartDataProtocol{
    func add(count: String, total: String)
    func sub(count: String, total: String)
}
