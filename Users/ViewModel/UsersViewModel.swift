//
//  UsersViewModel.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var filteredUsers: [UserModel] = []
    @Published var loading = false
    
    private let usersNetwork: UsersAPI
    
    init(usersNetwork: UsersAPI = UsersAPIService()) {
        self.usersNetwork = usersNetwork
    }
    
    func getUsers() {
        loading = true
        users = []
        filteredUsers = []
        
        usersNetwork.getUsers { response in
            self.toggleLoading()
            self.users.append(contentsOf: response)
            self.filteredUsers.append(contentsOf: response)
        } failure: { error in
            self.toggleLoading()
        }
    }
    
    func filterUsers(search: String) {
        if search.isEmpty {
            self.filteredUsers = self.users
        } else {
            self.filteredUsers = self.users.filter { user in
                user.name.lowercased().contains(search.lowercased())
            }
        }
    }
    
    private func toggleLoading(){
        let seconds = DispatchTimeInterval.seconds(1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.loading.toggle()
        }
    }
}
