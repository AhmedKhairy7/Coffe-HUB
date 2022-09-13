//
//  MenuTableViewCell.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 08/09/2022.
//

import Foundation
import UIKit
import SDWebImage

class MenuTableViewCell: UITableViewCell {
  @IBOutlet weak var menuImage: UIImageView!
  @IBOutlet weak var menuLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

  }


  func setupCell(menu: MenuElement?) {
    menuImage.sd_setImage(with: URL(string: menu!.image), placeholderImage: nil)
     menuLabel.text = menu?.name
  }

  
}
