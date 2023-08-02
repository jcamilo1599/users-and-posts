//
//  PostsViewModel.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    @Published var loading = false
    
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
        loading = true
        posts = []
        
        postsNetwork.getPosts() { response in
            self.toggleLoading()
            self.posts.append(contentsOf: response)
        } failure: { error in
            self.toggleLoading()
        }
    }
    
    private func toggleLoading(){
        let seconds = DispatchTimeInterval.seconds(1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.loading.toggle()
        }
    }
}
