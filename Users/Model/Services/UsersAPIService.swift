//
//  UsersAPIService.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation
import Alamofire

class UsersAPIService: UsersAPI {
    private let path = "/users"
    private let key = "BASE_URL"
    
    func getUsers(
        success: @escaping (_ users: [UserModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) {
        do {
            let baseURL = try ConfigManager.shared.value(for: key) as? String
            let serviceURL = baseURL! + path
            
            AF.request(serviceURL, method: .get).validate(statusCode: 200...299).responseDecodable(of: [UserModel].self) { response in
                if let users = response.value {
                    success(users)
                } else {
                    print(response.error!)
                    
                    failure(response.error)
                }
            }
        } catch let error as ConfigError {
            print(error)
            
            failure(error)
        } catch {
            print(error)
            
            failure(error)
        }
    }
}
