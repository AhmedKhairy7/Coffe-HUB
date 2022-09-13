//
//  RegisterNetwork.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 12/09/2022.
//

import Foundation
import Alamofire

class RegisterNetwork{
    func createUser(register: Register, completionHandler: @escaping (Bool, String)->()){
    let url = "https://coffee-shop2022.herokuapp.com/register"
        AF.request(url, method: .post, parameters: register, encoder: JSONParameterEncoder.default).response { response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response!.statusCode >= 200 {
                        completionHandler(true, "User register successfully")
                    } else {
                        completionHandler(false, "Please try again")
                    }
                } catch {
                    print(error.localizedDescription)
                    completionHandler(false, "Please try again")
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, "Please try again")
            }
        }
   }
}
