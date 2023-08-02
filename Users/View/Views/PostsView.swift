//
//  PostsView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import SwiftUI

struct PostsView: View {
    @State private var showAlert = false
    @ObservedObject private var viewModel: PostsViewModel
    
    var user: UserModel
    
    init(user: UserModel) {
        self.viewModel = PostsViewModel(userId: user.id)
        self.user = user
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                buildBody()
                    .padding(.horizontal, 20)
            }
        }
        .navigationTitle("Posts de \(user.name)")
        .modifier(LoadingModifier(show: $viewModel.loading))
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .accentColor(.orange)
        .onAppear() {
            viewModel.getPosts()
        }
    }
    
    @ViewBuilder
    private func buildBody() -> some View {
        if viewModel.posts.isEmpty {
            NoInfoView()
        } else {
            buildFilteredUsers()
        }
    }
    
    private func buildFilteredUsers() -> some View {
        ForEach(viewModel.posts, id: \.id) { post in
            CardPostView(post: post)
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostsView(user: UserModel(
                id: 1,
                name: "Juan Camilo",
                email: "jmarin1599@gmail.com",
                phone: "3005190365"
            ))
        }
    }
}
