//
//  PostsViewModel.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    @Published var showLoading = false
    
    private let postsNetwork: PostsAPI
    
    init(
        postsNetwork: PostsAPI = PostsAPIService(userId: nil),
        userId: Int?
    ) {
        if userId != nil {
            self.postsNetwork = PostsAPIService(userId: userId)
        } else {
            self.postsNetwork = postsNetwork
        }
    }
    
    func getPosts() {
        showLoading = true
        posts = []
        
        postsNetwork.getPosts() { response in
            self.loading()
            self.posts.append(contentsOf: response)
        } failure: { error in
            self.loading()
        }
    }
    
    private func loading(){
        let seconds = DispatchTimeInterval.seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.showLoading.toggle()
        }
    }
}
