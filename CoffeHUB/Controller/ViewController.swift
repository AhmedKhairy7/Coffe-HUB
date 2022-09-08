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
    self.arrMenu.append(Menu.init(photo: UIImage(named: "M1")!, name: "Espresso"))
    self.arrMenu.append(Menu.init(photo: UIImage(named: "M2")!, name: "Cappuccino"))
    self.arrMenu.append(Menu.init(photo: UIImage(named: "M3")!, name: "Macchiato"))
    self.arrMenu.append(Menu.init(photo: UIImage(named: "M4")!, name: "Mocha"))
    self.arrMenu.append(Menu.init(photo: UIImage(named: "M5")!, name: "Latte"))
  }
  private func setupTableView() {
    menuTbView.delegate = self
    menuTbView.dataSource = self

  }
  

}

