//
//  DatabaseManger.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 05/10/2022.
//

import Foundation
import CoreData
import UIKit

class DatabaseManger {

  static let shared = DatabaseManger()
  var appDelegate: AppDelegate!
  var manageObjectContext: NSManagedObjectContext!

  private init() {
    appDelegate = UIApplication.shared.delegate as! AppDelegate
    manageObjectContext = appDelegate.persistentContainer.viewContext
  }

  func saveDataofCart(name: String, price: String, totalPrice: String, countCoffee: String, image: String, type: String) {
    let entity = NSEntityDescription.entity(forEntityName: "CartEntity", in: manageObjectContext)!
    let cart = NSManagedObject(entity: entity, insertInto: manageObjectContext)
    cart.setValue(name, forKey: "name")
    cart.setValue(type, forKey: "type")
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

  func updateDataOfCart(name: String, price: String, totalPrice: String, countCoffee: String, image: String, type: String){

    let fetchRequest: NSFetchRequest<CartEntity>

    fetchRequest = CartEntity.fetchRequest()
    fetchRequest.fetchLimit = 1
    fetchRequest.predicate =  NSPredicate(format: "name= %@ AND type= %@", name,type)
    let objects = try! manageObjectContext.fetch(fetchRequest)
    for obj in objects {
      manageObjectContext.delete(obj)
    }
    do {
      try manageObjectContext.save()
      saveDataofCart(name: name, price: price, totalPrice: totalPrice, countCoffee: countCoffee, image: image, type: type)
    } catch let error as NSError{
      print(error.localizedDescription)
    }
  }

}
