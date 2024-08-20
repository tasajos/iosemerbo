//
//  EmergenciasAtendidasViewModel.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 19/8/24.
//

import SwiftUI
import FirebaseDatabase

class EmergenciasActivasViewModel: ObservableObject {
    @Published var emergenciasActivasList: [Emergencia] = []

    private var databaseRef: DatabaseReference = Database.database().reference()

    init() {
        fetchEmergenciasActivas()
    }

    struct Emergencia: Identifiable {
        let id: String
        let titulo: String
        let ciudad: String
        let fecha: String
        let descripcion: String
        let estado: String
        let imagen: String // Añadido campo imagen
    }

    private func fetchEmergenciasActivas() {
        databaseRef.child("ultimasEmergencias").observe(.value) { snapshot in
            var fetchedEmergencias: [Emergencia] = []

            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let data = snapshot.value as? [String: Any],
                   let titulo = data["Titulo"] as? String,
                   let ciudad = data["ciudad"] as? String,
                   let fecha = data["fecha"] as? String,
                   let descripcion = data["descripcion"] as? String,
                   let estado = data["estado"] as? String,
                   let imagen = data["imagen"] as? String, // Recuperar la URL de la imagen
                   estado == "Activo" {

                    let emergencia = Emergencia(
                        id: snapshot.key,
                        titulo: titulo,
                        ciudad: ciudad,
                        fecha: fecha,
                        descripcion: descripcion,
                        estado: estado,
                        imagen: imagen // Asignar la URL de la imagen
                    )
                    fetchedEmergencias.append(emergencia)
                }
            }

            self.emergenciasActivasList = fetchedEmergencias
        }
    }
}
