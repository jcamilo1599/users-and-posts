//
//  NoInfoView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 2/08/23.
//

import SwiftUI

struct NoInfoView: View {
    var body: some View {
        Text("No se encontró información")
            .padding()
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 1)
            )
            .padding()
    }
}

struct NoInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NoInfoView()
    }
}
