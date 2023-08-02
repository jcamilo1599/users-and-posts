//
//  UsersViewModel.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation
import CoreData

class UsersViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var filteredUsers: [UserModel] = []
    @Published var loading = false
    
    private let usersNetwork: UsersAPI
    
    init(usersNetwork: UsersAPI = UsersAPIService()) {
        self.usersNetwork = usersNetwork
    }
    
    func getUsers(_ context: NSManagedObjectContext) {
        if filteredUsers.isEmpty {
            loading = true
            users = []
            filteredUsers = []
            
            usersNetwork.getUsers { response in
                self.toggleLoading()
                self.users.append(contentsOf: response)
                self.filteredUsers.append(contentsOf: response)
                
                // Recorrer cada usuario obtenido y lo guarda localmente
                for user in response {
                    self.saveData(user: user, context: context)
                }
            } failure: { error in
                self.toggleLoading()
            }
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
    
    // Muestra u oculta la animación de cargando
    private func toggleLoading(){
        let seconds = DispatchTimeInterval.seconds(1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.loading.toggle()
        }
    }
    
    // Guarda los datos localmente con CoreData
    private func saveData(user: UserModel, context: NSManagedObjectContext) {
        let addUser = Users(context: context)
        addUser.id = user.id
        addUser.name = user.name
        addUser.email = user.email
        addUser.phone = user.phone
        
        do {
            try context.save()
            print("Se guardo \(String(describing: addUser.name))")
        } catch let error as NSError {
            print("No se guardo el usuario ",  error.localizedDescription)
        }
    }
}
