//
//  ViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 07/09/2022.
//

import UIKit

class ViewController: UIViewController {
  var arrMenu = [Menu]()
  @IBOutlet weak var menuTbView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Menu"
    setup()
    getMenuData()

  }
  private func setup() {

    setupTableView()
  }

  private func getMenuData() {
    self.arrMenu.append(Menu.init(photo: UIImage(named: "Espresso")!, name: "Espresso", price: "5"))
    self.arrMenu.append(Menu.init(photo: UIImage(named: "Cappuccino")!, name: "Cappuccino", price: "10"))
    self.arrMenu.append(Menu.init(photo: UIImage(named: "Macchiato")!, name: "Macchiato", price: "7"))
    self.arrMenu.append(Menu.init(photo: UIImage(named: "Mocha")!, name: "Mocha", price: "9"))
    self.arrMenu.append(Menu.init(photo: UIImage(named: "Latte")!, name: "Latte", price: "12"))
  }
  private func setupTableView() {
    menuTbView.delegate = self
    menuTbView.dataSource = self

  }
  

}

