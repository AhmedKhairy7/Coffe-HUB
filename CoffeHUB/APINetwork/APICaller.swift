//
//  MenuNetwork.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 13/09/2022.
//
import Foundation
import Alamofire

protocol APICallerProtocol {

  func createUser(method:String?,register: Register, completionHandler: @escaping (Bool, String)->())
  func loginUser(method:String?,login: LoginModel, completionHandler: @escaping Handler)
  func getAllUsreDataAF(method:String?,completion: @escaping (Result<[MenuElement], Error>) -> Void)
}

struct APICaller:APICallerProtocol {

  //  let service: Session?
  //
  //  init(service:Session? = Session.init(configuration: URLSessionConfiguration.default,
  //                                       startRequestsImmediately: true,
  //                                       cachedResponseHandler: nil)) {
  //    self.service = service
  //  }

  func createUser(method:String? = "register" ,register: Register, completionHandler: @escaping (Bool, String) -> ()) {

    AF.request(Constants.baseAPIURL + "\(method ?? "")", method: .post, parameters: register, encoder: JSONParameterEncoder.default).response { response in
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

  func loginUser(method:String? = "login" ,login: LoginModel, completionHandler: @escaping Handler) {

    AF.request(Constants.baseAPIURL + "\(method ?? "")", method: .post, parameters: login, encoder: JSONParameterEncoder.default).response { response in
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

  func getAllUsreDataAF(method:String? = "product/get" ,completion: @escaping (Result<[MenuElement], Error>) -> Void) {
    AF.request(Constants.baseAPIURL + "\(method ?? "")").validate(statusCode: 200..<300).response { response in
      if let data = response.data {
        do{
          let userResponse = try JSONDecoder().decode([MenuElement].self, from: data)

          completion(.success(userResponse))

        } catch {

          completion(.failure(error)) }
      }
    }
  }
}




