//
//  PostsAPIService.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation
import Alamofire

class PostsAPIService: PostsAPI {
    private let path = "/posts"
    private let key = "BASE_URL"
    
    var userId: Int32?
    
    init(userId: Int32?) {
        self.userId = userId
    }
    
    func getPosts(
        success: @escaping (_ users: [PostModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) {
        do {
            let baseURL = try ConfigManager.shared.value(for: key) as? String
            var serviceURL = baseURL! + path
            
            if userId != nil {
                serviceURL = serviceURL + "?userId=" + String(userId!)
            }
            
            AF.request(serviceURL, method: .get).validate(statusCode: 200...299).responseDecodable(of: [PostModel].self) {
                response in
                
                if let posts = response.value {
                    success(posts)
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
