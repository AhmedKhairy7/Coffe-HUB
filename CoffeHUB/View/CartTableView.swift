//
//  CartTableView.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import Foundation
import UIKit
import SDWebImage

extension CartViewController : UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return cartArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
      cell.cartName.text = cartArray[indexPath.row].nameCart
      cell.priceLabel.text = cartArray[indexPath.row].priceCart
      
      cell.cartImage.sd_setImage(with: URL(string: cartArray[indexPath.row].imageCart), placeholderImage: nil)
      cell.quantityLabel.text = cartArray[indexPath.row].countCoffeeCart
    return cell
  }


    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cartArray[indexPath.row]
            tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


}
