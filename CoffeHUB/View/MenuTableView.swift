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
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreferencesViewController") as? PreferencesViewController {
//      vc.modalPresentationStyle = .fullScreen
//      self.present(vc, animated: true, completion: nil)
//
//
//    }
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let vc = storyBoard.instantiateViewController(withIdentifier: "PreferencesViewController") as! PreferencesViewController
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated:true, completion:nil)
  }



}
