//
//  ProfileData.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 13/09/2022.
//

import Foundation

class ProfileData {
    static let shared = ProfileData()
    var name: String?
    var email: String?

    private init() { }
}
