//
//  PostsAPI.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation

protocol PostsAPI {
    func getPosts(
        success: @escaping (_ posts: [PostModel]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    )
}
