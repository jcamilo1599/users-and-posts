//
//  UserModel.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation

struct UserModel: Codable, Hashable {
    let id: Int
    let name, email, phone: String
}
