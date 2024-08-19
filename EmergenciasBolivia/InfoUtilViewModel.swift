//
//  InfoUtilViewModel.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 18/8/24.
//

import SwiftUI
import FirebaseDatabase

class InfoUtilViewModel: ObservableObject {
    @Published var infoUtilList: [InfoUtil] = []
    
    private var ref: DatabaseReference = Database.database().reference()

    init() {
        fetchInfoUtil()
    }

    func fetchInfoUtil() {
        ref.child("informacionutil").observe(.value) { snapshot in
            var fetchedInfoUtil: [InfoUtil] = []
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String: Any],
                   let nombre = dict["nombre"] as? String,
                   let imagen = dict["imagen"] as? String {
                    
                    let infoUtil = InfoUtil(id: childSnapshot.key, nombre: nombre, imagen: imagen)
                    fetchedInfoUtil.append(infoUtil)
                }
            }
            
            self.infoUtilList = fetchedInfoUtil
        }
    }
}
