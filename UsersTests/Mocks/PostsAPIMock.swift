//
//  PostsAPIMock.swift
//  UsersTests
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import Foundation
@testable import Users

class PostsAPIMock: PostsAPI {
    func getPosts(
        success: @escaping (_ posts: [PostModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) {
        let post = PostModel(
            id: 1,
            title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
            
        )
        
        success([post])
    }
}
