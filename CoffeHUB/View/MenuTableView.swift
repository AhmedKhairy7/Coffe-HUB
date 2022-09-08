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
    cell.setupCell(photo: data.photo, name: data.name)
    return cell
  }



}
