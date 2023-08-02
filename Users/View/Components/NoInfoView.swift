//
//  NoInfoView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import SwiftUI

struct NoInfoView: View {
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width - 32
            
            Text("No se encontró información")
                .frame(width: width)
                .padding(.horizontal, 16)
                .padding(.vertical)
                .background(.white)
                .cornerRadius(16)
                .shadow(radius: 2)
                .padding(.vertical)
        }
    }
}

struct NoInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NoInfoView()
    }
}
