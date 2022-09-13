//
//  MenuTableView.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 08/09/2022.
//

import Foundation
import UIKit

extension ViewController : TableViewConfig {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrMenu.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = menuTbView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
    let data = arrMenu[indexPath.row]
    cell.setupCell( menu: Menu.init(photo: data.photo, name: data.name, price: data.price))
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let vc = storyBoard.instantiateViewController(withIdentifier: "PreferencesViewController") as! PreferencesViewController
    vc.name = arrMenu[indexPath.row].name
    vc.price = arrMenu[indexPath.row].price
    vc.modalPresentationStyle = .fullScreen
    self.navigationController?.pushViewController(vc, animated: true)
  }



}



}
