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
    return cartNewArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
    cell.cartName.text = cartNewArray[indexPath.row].name
    cell.priceLabel.text = cartNewArray[indexPath.row].price
    cell.cartImage.sd_setImage(with: URL(string: cartNewArray[indexPath.row].image), placeholderImage: nil)
    cell.quantityLabel.text = cartNewArray[indexPath.row].countCoffee
    cell.delegate = self

    return cell
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        //MARK-#update total price when delete cell
//                totalPriceLabel.text = "\(Double(totalPriceLabel.text!)! - Double(cartNewArray[indexPath.row].price)!)"

      cartNewArray.remove(at: indexPath.row)
      manageObjectContext.delete(coreDataCart[indexPath.row])
      do{
        try manageObjectContext.save()
      } catch let error as NSError{
        print(error.localizedDescription)
      }
      tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {

      
    }
  }
}
