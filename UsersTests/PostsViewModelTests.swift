//
//  PostsViewModelTests.swift
//  UsersTests
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import XCTest
@testable import Users

final class PostsViewModelTests: XCTestCase {
    func testPostsAPI() {
        let sut = PostsViewModel(postsAPI: PostsAPIMock(), userId: nil)
        sut.getPosts()
                
        XCTAssert(sut.posts.count == 1)
    }
}
