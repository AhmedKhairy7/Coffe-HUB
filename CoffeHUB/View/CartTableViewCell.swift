//
//  CartTableViewCell.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {

  
  @IBOutlet weak var quantityLabel: UILabel!
  @IBAction func minusButton(_ sender: UIButton) {
  }
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var cartName: UILabel!
  @IBOutlet weak var backGroundView: UIView!

  @IBAction func plusButton(_ sender: UIButton) {
  }
  @IBOutlet weak var minusButton: UIButton!
  @IBOutlet weak var cartImage: UIImageView!

  @IBOutlet weak var priceLabel: UILabel!
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

}
