//
//  MenuTableView.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 08/09/2022.
//

import Foundation
import UIKit
import SDWebImage

extension ViewController : TableViewConfig {
  
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrMenu.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = menuTbView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
    let data = arrMenu[indexPath.row]
      cell.selectionStyle = .none
    cell.setupCell(menu: data)
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let vc = storyBoard.instantiateViewController(withIdentifier: "PreferencesViewController") as! PreferencesViewController
    vc.name = arrMenu[indexPath.row].name
    vc.mediumPrice = arrMenu[indexPath.row].mediumPrice
    vc.image = arrMenu[indexPath.row].image
    vc.modalPresentationStyle = .fullScreen
    self.navigationController?.pushViewController(vc, animated: true)
  }


}




