//
//  UsersView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import SwiftUI

struct UsersView: View {
    @Environment(\.managedObjectContext) var context
    
    @ObservedObject private var viewModel = UsersViewModel()
    @FetchRequest(entity: Users.entity(), sortDescriptors: [], animation: .spring()) var results: FetchedResults<Users>
    
    // Filtro de busqueda
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    buildBody()
                        .padding(.horizontal, 20)
                }
            }
            .searchable(text: $searchText, prompt: Text("Buscar usuario")) { buildFilteredUsers() }
            .navigationTitle("Prueba de Ingreso")
            .onChange(of: searchText) { _ in
                viewModel.filterUsers(search: searchText)
            }
        }
        .modifier(LoadingModifier(show: $viewModel.loading))
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .onAppear() {
            viewModel.users = results.map { $0.toUserModel() }
            viewModel.filteredUsers = viewModel.users
            viewModel.getUsers(context)
        }
    }
    
    @ViewBuilder
    private func buildBody() -> some View {
        if viewModel.filteredUsers.isEmpty {
            NoInfoView()
        } else {
            buildFilteredUsers()
        }
    }
    
    private func buildFilteredUsers() -> some View {
        ForEach(viewModel.filteredUsers, id: \.id) { CardUserView(user: $0) }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
