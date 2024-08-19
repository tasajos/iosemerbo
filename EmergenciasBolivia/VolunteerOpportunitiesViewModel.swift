//
//  VolunteerOpportunitiesViewModel.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 18/8/24.
//

import SwiftUI
import FirebaseDatabase

class VolunteerOpportunitiesViewModel: ObservableObject {
    @Published var volunteerOpportunitiesList: [OportunidadVoluntariado] = []

    private var databaseRef: DatabaseReference = Database.database().reference()

    init() {
        fetchVolunteerOpportunities()
    }

    struct OportunidadVoluntariado: Identifiable {
        let id: String
        let titulo: String
        let fecha: String
        let descripcion: String
        let imagen: String
        let estado: String
    }

    private func fetchVolunteerOpportunities() {
        databaseRef.child("oportunidadesVoluntariado").observe(.value) { snapshot in
            var fetchedOpportunities: [OportunidadVoluntariado] = []

            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let data = snapshot.value as? [String: Any],
                   let titulo = data["titulo"] as? String,
                   let fecha = data["fecha"] as? String,
                   let imagen = data["imagen"] as? String,
                   let descripcion = data["descripcion"] as? String,
                   let estado = data["estado"] as? String,
                   estado == "Activo" {  // Filtrando solo los que están en estado "Activo"

                    let oportunidad = OportunidadVoluntariado(
                        id: snapshot.key,  // Aquí pasas el ID que falta
                        titulo: titulo,
                        fecha: fecha,
                        descripcion: descripcion,
                        imagen: imagen,
                        estado: estado
                    )
                    fetchedOpportunities.append(oportunidad)
                }
            }

            self.volunteerOpportunitiesList = fetchedOpportunities
        }
    }
}
