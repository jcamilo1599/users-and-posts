//
//  LoadingModifier.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                VStack {
                    ProgressView()
                        .controlSize(.large)
                }
                .frame(width: 160, height: 160)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
            }
        }
    }
}

struct LoadingModifier_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {}
            .modifier(LoadingModifier(show: .constant(true)))
    }
}
