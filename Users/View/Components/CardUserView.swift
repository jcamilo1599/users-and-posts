//
//  CardUserView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import SwiftUI

struct CardUserView: View {
    var user: UserModel
    var viewPosts: Bool
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(user.name)
                .foregroundColor(.darkGreen)
                .font(.system(size: 26, weight: .semibold))
                .padding(.bottom, 2)
            
            HStack {
                ZStack {
                    Image(systemName: "phone.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.darkGreen)
                }
                .frame(width: 30, height: 24)
                
                Text(user.phone)
            }
            .padding(.bottom, 2)
            
            HStack {
                ZStack {
                    Image(systemName: "envelope")
                        .font(.system(size: 24))
                        .foregroundColor(.darkGreen)
                }
                .frame(width: 30, height: 24)
                
                Text(user.email)
            }
            
            HStack {
                Spacer()
                
                if viewPosts {
                    NavigationLink(
                        destination: PostsView(user: user),
                        label: {
                            Text("VER PUBLICACIONES")
                                .foregroundColor(.darkGreen)
                                .padding(.vertical)
                        })
                }
            }
        }
        .padding()
        .background(Color("bgColor"))
        .cornerRadius(16)
        .shadow(radius: 2)
    }
}

struct CardUserView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            CardUserView(
                user: UserModel(
                    id: 0,
                    name: "Juan Camilo",
                    email: "jmarin1599@gmail.com",
                    phone: "3005190365"
                ),
                viewPosts: true
            )
        }
    }
}
