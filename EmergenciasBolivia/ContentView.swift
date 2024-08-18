//
//  ContentView.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 17/8/24.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Título
            Text("Emergencias de Bolivia")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 50)

            // Imagen
            Image("voluntario")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.top, 30)
                .foregroundColor(.white)

            // Subtítulo
            Text("Conoce, Apoya y Reporta a las unidades de Emergencia de Bolivia")
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.top, 20)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Spacer()

            // Botón de Ingresar
            Button(action: {
                print("Botón INGRESAR presionado")
                // Aquí puedes manejar la navegación
            }) {
                Text("INGRESAR")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
            }
            .padding(.bottom, 50)
        }
        .background(Color(red: 0.0, green: 0.74, blue: 0.84))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
