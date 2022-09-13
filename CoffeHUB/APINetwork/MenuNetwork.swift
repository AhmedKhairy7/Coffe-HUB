//
//  MenuNetwork.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 13/09/2022.
//

import Foundation
import Alamofire

  // MARK: GET API

protocol APICallerProtocol {}

  final class APICaller {

    static let shared = APICaller()

    private init() { }

    struct Constants {
      static let baseAPIURL = "https://coffee-shop2022.herokuapp.com/product/get"
    }
    enum APIError: Error {
      case failedToGetData
    }

  func getAllUsreDataAF(completion: @escaping (Result<[MenuElement], Error>) -> Void){
    AF.request(Constants.baseAPIURL).response { response in
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

