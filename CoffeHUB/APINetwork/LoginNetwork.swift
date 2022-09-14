//
//  LoginNetwork.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 12/09/2022.
//

import Foundation
import Alamofire
import UIKit


enum APIErros: Error{
    case custom(message: String)
}



class LoginNetwork{
  
    func loginUser(login: LoginModel, completionHandler: @escaping Handler){
        
        let url = "https://coffee-shop2022.herokuapp.com/login"
            AF.request(url, method: .post, parameters: login, encoder: JSONParameterEncoder.default).response { response in
                switch response.result{
                case .success(let data):
                    do{
                        guard let checkData = data else {
                            completionHandler(.failure(.custom(message: "Please, Create Your Account")))
                            return  }
                        let json = try JSONSerialization.jsonObject(with: checkData , options: [])
                        print(json)
                        if response.response!.statusCode >= 200{
                            completionHandler(.success(json))
                        } else {
                            completionHandler(.failure(.custom(message: "Please check your network connectivity")))
                        }
                    } catch {
                        print(error.localizedDescription)
                         completionHandler(.failure(.custom(message: "Please try again")))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "Please try again")))
                }
            }
          
    }
}
