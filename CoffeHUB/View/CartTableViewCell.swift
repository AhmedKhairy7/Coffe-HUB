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
  var total = 0.0
  var count = 0.0
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
    let updateCount = count - 1
    quantityLabel.text = "\(updateCount)"
    total = total - total/count
    delegate.add(count: Double(updateCount), total: total, price: total/count)
  }

  @IBAction func plusButton(_ sender: UIButton) {
    let updateCount = count + 1
    quantityLabel.text = "\(updateCount)"
    total = total + total/count
    delegate.sub(count: Double(updateCount), total: total, price: total/count)
  }
}

protocol CartDataProtocol{
  func add(count: Double, total: Double,price:Double)
  func sub(count: Double, total: Double,price:Double)
}
