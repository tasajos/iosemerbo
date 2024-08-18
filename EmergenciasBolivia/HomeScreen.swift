//
//  HomeScreen.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 18/8/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            // Color de fondo que ocupa toda la pantalla
            Color(red: 30/255, green: 192/255, blue: 203/255)
                .edgesIgnoringSafeArea(.all) // Asegura que el color de fondo se extienda a toda la pantalla

            VStack {
                // Título
                Text("Emergencias de Bolivia")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(Color(red: 246/255, green: 245/255, blue: 250/255))
                    .padding(.bottom, 60)

                // Imagen
                Image("voluntario") // Asegúrate de que la imagen esté en Assets.xcassets
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 20)

                // Subtítulo
                Text("Conoce, Apoya y Reporta a las unidades de Emergencia de Bolivia")
                    .font(.system(size: 18))
                    .foregroundColor(Color(red: 246/255, green: 245/255, blue: 250/255))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .padding(.bottom, 60)

                // Botón de Ingresar
                NavigationLink(destination: Homev2Screen()) { // Navega a la vista Homev2
                    Text("INGRESAR")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 30)
                        .background(Color(red: 81/255, green: 129/255, blue: 184/255))
                        .cornerRadius(25)
                        .shadow(radius: 2)
                }
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Homev2Screen: View {
    var body: some View {
        Text("Bienvenido a la siguiente pantalla!") // Reemplaza con el contenido de la pantalla "Homev2"
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
    }
}
