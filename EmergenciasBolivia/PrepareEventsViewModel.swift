//
//  PrepareEventsViewModel.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 18/8/24.
//

import SwiftUI
import FirebaseDatabase

class PrepareEventsViewModel: ObservableObject {
    @Published var prepareEventsList: [PreparacionEvento] = []

    private var databaseRef: DatabaseReference = Database.database().reference()

    init() {
        fetchPrepareEvents()
    }
    
    struct PreparacionEvento: Identifiable {
        let id: String
        let nombre: String
        let descripcion: String
        let imagen: String
        let estado: String  // Añadimos el campo de estado para filtrar
    }

    private func fetchPrepareEvents() {
        databaseRef.child("preparate").observe(.value) { snapshot in
            var fetchedEvents: [PreparacionEvento] = []

            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let data = snapshot.value as? [String: Any],
                   let nombre = data["nombre"] as? String,
                   let descripcion = data["descripcion"] as? String,
                   let imagen = data["imagen"] as? String,
                   let estado = data["estado"] as? String,
                   estado == "Activo" {  // Filtramos solo los que están en estado "Activo"

                    let evento = PreparacionEvento(
                        id: snapshot.key,
                        nombre: nombre,
                        descripcion: descripcion,
                        imagen: imagen,
                        estado: estado
                    )
                    fetchedEvents.append(evento)
                }
            }

            self.prepareEventsList = fetchedEvents
        }
    }
}



