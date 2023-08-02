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
    @Published var showLoading = false
    
    private let usersNetwork: UsersAPI
    
    init(usersNetwork: UsersAPI = UsersAPIService()) {
        self.usersNetwork = usersNetwork
    }
    
    func getUsers() {
        showLoading = true
        users = []
        filteredUsers = []
        
        usersNetwork.getUsers { response in
            self.loading()
            self.users.append(contentsOf: response)
            self.filteredUsers.append(contentsOf: response)
        } failure: { error in
            self.loading()
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
    
    private func loading(){
        let seconds = DispatchTimeInterval.seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.showLoading.toggle()
        }
    }
}
