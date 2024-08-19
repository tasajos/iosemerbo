//
//  EmergenciasBoliviaApp.swift
//  EmergenciasBolivia
//
//  Created by Carlos Azcarraga on 17/8/24.
//

import SwiftUI
import Firebase

@main
struct EmergenciasBoliviaApp: App {
    
    init (){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
