//
//  UsersExt.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import Foundation

// Extension para el modelo CoreData "Users"
extension Users {
    func toUserModel() -> UserModel {
        UserModel(id: self.id, name: self.name ?? "", email: self.email ?? "", phone: self.phone ?? "")
    }
}
