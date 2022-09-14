//
//  ViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 07/09/2022.
//

import UIKit

class ViewController: UIViewController {
  var arrMenu = [MenuElement]()
  @IBOutlet weak var menuTbView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    rsponseApi()
  }
  private func setup() {

    setupTableView()
  }

  private func setupTableView() {
    menuTbView.delegate = self
    menuTbView.dataSource = self

  }

  private func rsponseApi() {
    APICaller().getAllUsreDataAF { [weak self] response in
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

