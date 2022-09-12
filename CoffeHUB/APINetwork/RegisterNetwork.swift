//
//  RegisterNetwork.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 12/09/2022.
//

import Foundation
import Alamofire

class RegisterNetwork{
    func createUser(name: String, email: String, password: String){
    let url = "https://coffee-shop2022.herokuapp.com/login"
    let parameters: [String: String] = ["name": name, "email": email, "password": password]
//    AF.request( url, method: .post, parameters: parameters)
//    .validate()
//    .responseDecodable(of: [Register].self) { response in
//        guard let user = response.value else { return }
//        print("job= \(user)") }
//    }
    
//        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).response { response in
//            debugPrint(response)
//        }
                       
}
}
