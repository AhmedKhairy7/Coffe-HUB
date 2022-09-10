//
//  PreferencesViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit

class PreferencesViewController: UIViewController {

    @IBOutlet weak var cartBtnOutlet: UIButton!
    
    @IBOutlet weak var nameCoffee: UILabel!
    
    @IBOutlet weak var priceCoffee: UILabel!
    
    @IBOutlet weak var countCoffee: UILabel!
    
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var smallCoffeeOutlet: UIButton!
    
    
    @IBOutlet weak var mediumCoffeeOutlet: UIButton!
    
    @IBOutlet weak var largeCoffeeOutlet: UIButton!
    
    @IBOutlet weak var noSugarOutlet: UIButton!
    
    @IBOutlet weak var oneSugarOutlet: UIButton!
    
    @IBOutlet weak var twoSugarOutlet: UIButton!
    
    @IBOutlet weak var threeSugarOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        cartBtnOutlet.layer.cornerRadius = 25
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
    }
    
    @IBAction func decreaseBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func smallCoffeeBtn(_ sender: UIButton) {
    }
    
    @IBAction func mediumCoffeeBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func largeCoffeeBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func noSugarBtn(_ sender: UIButton) {
    }
    
    @IBAction func oneSugarBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func twoSugarBtn(_ sender: UIButton) {
    }
    
    @IBAction func threeSugarBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func addToCart(_ sender: UIButton) {
    }
    
}
