//
//  CardPostView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import SwiftUI

struct CardPostView: View {
    @State var showBody = false
    
    var post: PostModel
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(post.title)
                .foregroundColor(.darkGreen)
                .font(.system(size: 26, weight: .semibold))
                .padding(.bottom, 2)
            
            Text(post.body)
            
            HStack {
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(16)
                        .background(Color.darkGreen)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 2)
    }
}

struct CardPostView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 30) {
                CardPostView(post: PostModel(
                    id: 1,
                    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                    body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
                    
                ))
                .padding(.horizontal, 20)
            }
        }
    }
}
