//
//  Homev2Screen.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 18/8/24.
//


import SwiftUI

struct Homev2Screen: View {
    @StateObject private var viewModel = InfoUtilViewModel()
    
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
                        .frame(width: 180, height: 60)
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
                        ForEach(viewModel.infoUtilList) { info in
                            InfoCard(imageName: info.imagen, title: info.nombre)
                        }
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

struct URLImage: View {
    @State private var loadedImage: UIImage? = nil
    let imageUrl: String

    var body: some View {
        Group {
            if let loadedImage = loadedImage {
                Image(uiImage: loadedImage)
                    .resizable()
                    .scaledToFill() // Utiliza scaledToFill para llenar el espacio disponible
                    .clipped() // Recorta la imagen para que no se salga del marco
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
        }
        .onAppear {
            loadImage()
        }
    }

    private func loadImage() {
        guard let url = URL(string: imageUrl) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self.loadedImage = image
            }
        }.resume()
    }
}

struct InfoCard: View {
    let imageName: String
    let title: String

    var body: some View {
        HStack {
            URLImage(imageUrl: imageName)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            Spacer()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.trailing, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 300, height: 100) // Ajusta el tamaño según sea necesario
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
