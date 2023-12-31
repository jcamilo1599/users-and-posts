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
    
    private let postsAPI: PostsAPI
    
    init(
        postsAPI: PostsAPI = PostsAPIService(userId: nil),
        userId: Int32?
    ) {
        if userId != nil {
            self.postsAPI = PostsAPIService(userId: userId)
        } else {
            self.postsAPI = postsAPI
        }
    }
    
    func getPosts() {
        loading = true
        posts = []
        
        postsAPI.getPosts() { response in
            self.toggleLoading()
            self.posts.append(contentsOf: response)
        } failure: { error in
            self.toggleLoading()
        }
    }
    
    // Muestra u oculta la animación de cargando
    private func toggleLoading(){
        let seconds = DispatchTimeInterval.seconds(1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.loading.toggle()
        }
    }
}
