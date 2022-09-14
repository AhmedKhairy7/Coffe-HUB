//
//  ExtensionPreferenceViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 13/09/2022.
//

import Foundation
import CoreData

extension PreferencesViewController{
  func saveDataofCart(name: String, price: String, totalPrice: String, countCoffee: String, image: String){
    let entity = NSEntityDescription.entity(forEntityName: "CartEntity", in: manageObjectContext)!
    let cart = NSManagedObject(entity: entity, insertInto: manageObjectContext)
    cart.setValue(name, forKey: "name")
    cart.setValue(price, forKey: "price")
    cart.setValue(totalPrice, forKey: "totalPrice")
    cart.setValue(countCoffee, forKey: "countCoffee")
    cart.setValue(image, forKey: "image")
    do{
      try manageObjectContext.save()
      print("Save data cart")
    }
    catch let error as NSError{
      print(error.localizedDescription)
    }
  }
}
