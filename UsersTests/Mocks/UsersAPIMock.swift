//
//  UsersAPIMock.swift
//  UsersTests
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import Foundation
@testable import Users

class UsersAPIMock: UsersAPI {
    func getUsers(
        success: @escaping (_ users: [UserModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) {
        let user = UserModel(
            id: 0,
            name: "Juan Camilo",
            email: "jmarin1599@gmail.com",
            phone: "3005190365"
        )

        success([user])
    }
}
