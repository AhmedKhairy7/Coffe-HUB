//
//  RegisterNetwork.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 12/09/2022.
//

import Foundation
import Alamofire

class RegisterNetwork{
    func createUser(register: Register){
    let url = "https://coffee-shop2022.herokuapp.com/login"
        AF.request(url, method: .post, parameters: register, encoder: JSONParameterEncoder.default).response { response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
}
}
