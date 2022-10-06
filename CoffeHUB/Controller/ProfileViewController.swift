//
//  ProfileViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
  @IBOutlet weak var profileView: UIView!
  @IBOutlet weak var mailLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var mailView: UIView!
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var phoneView: UIView!
  @IBOutlet weak var logoutButton: UIButton!
  var appDelegate: AppDelegate!
  var manageObjectContext: NSManagedObjectContext!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    fetchProfileData()
    appDelegate = UIApplication.shared.delegate as! AppDelegate
    manageObjectContext = appDelegate.persistentContainer.viewContext
  }
  
  @IBAction func logoutButton(_ sender: UIButton) {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Auth", bundle:nil)
    let vc = storyBoard.instantiateViewController(withIdentifier: "LogInViewController")
    self.navigationController?.pushViewController(vc, animated: true)
    deleteAllCoreData()
  }
  
  public func deleteAllCoreData(){
    let allDataCart = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "CartEntity"))
    do {
      try manageObjectContext.execute(allDataCart)
    }
    catch let error as NSError{
      print(error.localizedDescription)
    }
  }
  
  private func setupUI() {
    mailView.dropShadow()
    phoneView.dropShadow()
    phoneView.cornerRadius()
    mailView.cornerRadius()
    logoutButton.cornerRadius()
    logoutButton.dropShadow()
  }
  
  private func fetchProfileData(){
    // User defualts
    nameLabel.text =  UserDefaults.standard.string(forKey: "name") as! String
    mailLabel.text = UserDefaults.standard.string(forKey: "emailUser") as! String
  }
  
  
}


