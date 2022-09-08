//
//  MenuTableViewCell.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 08/09/2022.
//

import Foundation
import UIKit

class MenuTableViewCell: UITableViewCell {
  @IBOutlet weak var menuImage: UIImageView!
  @IBOutlet weak var menuLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

  }



  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)


  }


  func setupCell(photo: UIImage, name : String) {

    menuImage.image = photo
    menuLabel.text = name
  }

  
}
