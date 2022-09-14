//
//  ExtensionRegisterViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 11/09/2022.
//

import Foundation
import CoreData

extension RegisterViewController{
  
  func saveDataofRegister(name: String, email: String, password: String){
    let entity = NSEntityDescription.entity(forEntityName: "CoffeeEntity", in: manageObjectContext)!
    let coffee = NSManagedObject(entity: entity, insertInto: manageObjectContext)
    coffee.setValue(name, forKey: "name")
    coffee.setValue(email, forKey: "email")
    coffee.setValue(password, forKey: "password")
    do{
      try manageObjectContext.save()
      print("Save data register")
    }
    catch let error as NSError{
      print(error.localizedDescription)
    }
  }
}
