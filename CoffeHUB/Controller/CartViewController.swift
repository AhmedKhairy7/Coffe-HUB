//
//  CartViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit

class CartViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var subtotalLabel: UILabel!
  @IBOutlet weak var shippingLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!
  @IBAction func checkoutButton(_ sender: UIButton) {
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.dataSource = self
      tableView.delegate = self


    }




}

