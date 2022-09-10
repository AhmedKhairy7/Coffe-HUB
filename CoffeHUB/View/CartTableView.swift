//
//  CartTableView.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import Foundation
import UIKit

extension CartViewController : UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
    cell.textLabel?.text = ""
    return cell
  }



}
