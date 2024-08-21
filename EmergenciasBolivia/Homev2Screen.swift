//
//  Homev2Screen.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 18/8/24.
//

import SwiftUI

struct Homev2Screen: View {
    @StateObject private var infoUtilViewModel = InfoUtilViewModel()
    @StateObject private var volunteerOpportunitiesViewModel = VolunteerOpportunitiesViewModel()
    @StateObject private var prepareEventsViewModel = PrepareEventsViewModel()
    @StateObject private var emergenciasActivasViewModel = EmergenciasActivasViewModel()
    @StateObject private var emergenciasAtendidasViewModel = EmergenciasAtendidasViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ScrollView { // ScrollView vertical que envuelve el contenido
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
                                    ForEach(infoUtilViewModel.infoUtilList) { info in
                                        InfoCard(imageName: info.imagen, title: info.nombre)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 20)
                        
                        // Sección de OPORTUNIDADES DE VOLUNTARIADO
                        VStack(alignment: .leading) {
                            Text("OPORTUNIDADES DE VOLUNTARIADO")
                                .font(.headline)
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(volunteerOpportunitiesViewModel.volunteerOpportunitiesList) { opportunity in
                                        InfoCard(imageName: opportunity.imagen, title: opportunity.titulo)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 20)
                        
                        // Sección de PREPÁRATE PARA LOS EVENTOS
                        VStack(alignment: .leading) {
                            Text("PREPÁRATE PARA LOS EVENTOS")
                                .font(.headline)
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(prepareEventsViewModel.prepareEventsList) { event in
                                        InfoCard(imageName: event.imagen, title: event.nombre)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 20)

                        // Sección de ULTIMAS EMERGENCIAS
                        VStack(alignment: .leading) {
                            Text("ULTIMAS EMERGENCIAS")
                                .font(.headline)
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(emergenciasActivasViewModel.emergenciasActivasList) { emergencia in
                                        EmergencyInfoCard(
                                            title: emergencia.titulo,
                                            city: emergencia.ciudad,
                                            date: emergencia.fecha,
                                            description: emergencia.descripcion,
                                            estado: emergencia.estado,
                                            isControlled: false
                                        )
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 20)

                        // Sección de EMERGENCIAS ATENDIDAS
                        VStack(alignment: .leading) {
                            Text("EMERGENCIAS ATENDIDAS")
                                .font(.headline)
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(emergenciasAtendidasViewModel.emergenciasAtendidasList) { emergencia in
                                        EmergencyInfoCard(
                                            title: emergencia.titulo,
                                            city: emergencia.ciudad,
                                            date: emergencia.fecha,
                                            description: emergencia.descripcion,
                                            estado: emergencia.estado,
                                            isControlled: true
                                        )
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 20)
                        
                        Spacer(minLength: geometry.size.height * 0.15) // Espacio adicional para que el contenido pueda ser completamente visible
                    }
                    .padding()
                }
                
                FloatingButtonBar()
                    .frame(height: geometry.size.height * 0.15) // Ocupa el 15% de la pantalla
                    .background(Color.white.opacity(0.9)) // Fondo de la barra fija
                    .padding([.leading, .trailing, .bottom], 0)
            }
        }
    }
}

struct ImageButton: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 60, height: 60)
            .scaledToFit()
            .cornerRadius(5)
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
                .cornerRadius(5)
            
            Spacer()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.trailing, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 300, height: 100) // Ajusta el tamaño según sea necesario
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 1)
    }
}

struct EmergencyInfoCard: View {
    let title: String
    let city: String
    let date: String
    let description: String
    let estado: String
    let isControlled: Bool

    var body: some View {
        HStack {
            Image("luces") // Utiliza la imagen por defecto llamada "luces"
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.red)
                Text(city)
                    .font(.subheadline)
                    .foregroundColor(.red)
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(description)
                    .font(.body)
                    .foregroundColor(.black)
                Text("Estado: \(estado)")
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding()
        .frame(width: 300, height: 100) // Ajusta el tamaño según sea necesario
        .background(isControlled ? Color.green.opacity(0.1) : Color.red.opacity(0.1)) // Fondo verde claro para atendidas, rojo claro para activas
        .cornerRadius(5)
    }
}

struct FloatingButtonBar: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                // Acción para el primer botón
            }) {
                Image("hogar") // Reemplaza con la imagen correspondiente
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
            }

            Spacer()

            Button(action: {
                // Acción para el segundo botón
            }) {
                Image("mapa") // Reemplaza con la imagen correspondiente
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
            }

            Spacer()

            Button(action: {
                // Acción para el tercer botón
            }) {
                Image("alerta") // Reemplaza con la imagen correspondiente
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
            }

            Spacer()

            Button(action: {
                // Acción para el cuarto botón
            }) {
                Image("whatsapp") // Reemplaza con la imagen correspondiente
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
            }

            Spacer()

            Button(action: {
                // Acción para el quinto botón
            }) {
                Image("acceso") // Reemplaza con la imagen correspondiente
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
            }

            //Spacer()
        }
        .background(Color.white.opacity(0.9)) // Fondo de la barra fija
        .padding([.leading, .trailing, .bottom], 0)
    }
}

struct FloatingButtonBar_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButtonBar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct Homev2Screen_Previews: PreviewProvider {
    static var previews: some View {
        Homev2Screen()
    }
}
