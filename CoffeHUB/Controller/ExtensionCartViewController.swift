//
//  ExtensionCartViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 13/09/2022.
//

import Foundation
import CoreData

extension CartViewController{
  func fetchDataCart(){
    cartNewArray.removeAll()
    let fetchData = NSFetchRequest<NSManagedObject>(entityName: "CartEntity")
    do{
      coreDataCart = try manageObjectContext.fetch(fetchData)
      for item in coreDataCart{
        let name = item.value(forKey: "name") as! String
        let price = item.value(forKey: "price") as! String
        let totalPrice = item.value(forKey: "totalPrice") as! String
        let countCoffee = item.value(forKey: "countCoffee") as! String
        let image = item.value(forKey: "image") as! String
        let objectCoffeeCart = CoffeeCart(name: name, price: price, totalPrice: totalPrice, countCoffee: countCoffee, image: image)
        cartNewArray.append(objectCoffeeCart)
      }
      print("fetch data!")
    }
    catch let error as NSError{
      print(error.localizedDescription)
    }
  }
}
