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

            // Sección de INFORMACIÓN ÚTIL
            VStack(alignment: .leading) {
                Text("INFORMACIÓN ÚTIL")
                    .font(.headline)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        InfoCard(imageName: "Eventos", title: "Eventos")
                        InfoCard(imageName: "Voluntarios", title: "Conviértete en Voluntario")
                        InfoCard(imageName: "Kits", title: "Kits")
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

struct InfoCard: View {
    let imageName: String
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .cornerRadius(10)

            Text(title)
                .font(.caption)
                .foregroundColor(.black)
                .padding(.top, 5)
        }
        .frame(width: 150, height: 120)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct Homev2Screen_Previews: PreviewProvider {
    static var previews: some View {
        Homev2Screen()
    }
}
