//
//  ViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 07/09/2022.
//

import UIKit

class ViewController: UIViewController {
//  var arrMenu = [Menu]()
  var arrMenu = [MenuElement]()
  @IBOutlet weak var menuTbView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
//    setup()
    getMenuData()
    rsponseApi()

  }
  private func setup() {

    setupTableView()
  }

  private func getMenuData() {
//    self.arrMenu.append(Menu.init(photo: UIImage(named: "Espresso")!, name: "Espresso", price: "5"))
//    self.arrMenu.append(Menu.init(photo: UIImage(named: "Cappuccino")!, name: "Cappuccino", price: "10"))
//    self.arrMenu.append(Menu.init(photo: UIImage(named: "Macchiato")!, name: "Macchiato", price: "7"))
//    self.arrMenu.append(Menu.init(photo: UIImage(named: "Mocha")!, name: "Mocha", price: "9"))
//    self.arrMenu.append(Menu.init(photo: UIImage(named: "Latte")!, name: "Latte", price: "12"))

  }
  private func setupTableView() {
    menuTbView.delegate = self
    menuTbView.dataSource = self

  }

  private func rsponseApi() {
    APICaller.shared.getAllUsreDataAF { [weak self] response in
      switch response {
      case.success(let data):
        self?.setupTableView()
        self?.arrMenu = data
        print(data)
        DispatchQueue.main.async {
          self?.menuTbView.reloadData()
        }

      case .failure(let err):
        let alert = UIAlertController(title: "ERROR", message: "\(err)", preferredStyle: UIAlertController.Style.alert)
        self?.present(alert, animated: true, completion: nil)
       }
    }
  }
  
}

