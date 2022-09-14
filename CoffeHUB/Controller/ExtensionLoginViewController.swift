//
//  ExtensionLoginViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 11/09/2022.
//

import Foundation
import CoreData

extension LogInViewController{
  func fetchDataRegister(){
    DataPersonArray.removeAll()
    let fetchData = NSFetchRequest<NSManagedObject>(entityName: "CoffeeEntity")
    do{
      coreDataArray = try manageObjectContext.fetch(fetchData)
      for item in coreDataArray{
        let name = item.value(forKey: "name") as! String
        let email = item.value(forKey: "email") as! String
        let password = item.value(forKey: "password") as! String
        let objectRegisterModel = Register(name: name, email: email, password: password)
        DataPersonArray.append(objectRegisterModel)
      }
      print("fetch data!")
    }
    catch let error as NSError{
      print(error.localizedDescription)
    }
  }
}
