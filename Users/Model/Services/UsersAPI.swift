//
//  UsersAPI.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation

protocol UsersAPI {
    func getUsers(
        success: @escaping (_ users: [UserModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    )
}
