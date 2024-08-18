//
//  Homev2Screen.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 18/8/24.
//


import SwiftUI

struct Homev2Screen: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("VOLUNTARIOS")
                        .font(.headline)
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ImageButton(imageName: "voluntario", action: { print("Voluntario presionado") })
                        }
                        .padding(.horizontal)
                    }

                    Text("INFORMACIÓN ÚTIL")
                        .font(.headline)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct ImageButton: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName) // Cambié a systemName para asegurarme de que hay una imagen
                .resizable()
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(40)
        }
    }
}

struct Homev2Screen_Previews: PreviewProvider {
    static var previews: some View {
        Homev2Screen()
    }
}
