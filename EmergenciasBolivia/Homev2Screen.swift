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
            // Sección de "Con el Apoyo de"
            VStack(spacing: 10) {
                Text("Con el Apoyo de")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 20) {
                    Image("logoins")
                        .resizable()
                        .frame(width: 200, height: 80)
                        .scaledToFit()
                }
            }
            .padding()

            // Sección de VOLUNTARIOS
            VStack(alignment: .leading) {
                Text("VOLUNTARIOS")
                    .font(.headline)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ImageButton(imageName: "canalw")
                        ImageButton(imageName: "bomberos")
                        ImageButton(imageName: "ambulancias")
                        ImageButton(imageName: "hospitales")
                        ImageButton(imageName: "educacion")
                        ImageButton(imageName: "ambientalistas")
                        ImageButton(imageName: "animalistas")
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top, 20)

            Spacer()
        }
        .padding()
    }
}

struct ImageButton: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 60, height: 60)
            .scaledToFit()
            .cornerRadius(10)
    }
}

struct Homev2Screen_Previews: PreviewProvider {
    static var previews: some View {
        Homev2Screen()
    }
}
