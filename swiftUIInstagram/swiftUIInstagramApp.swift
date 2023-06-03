//
//  swiftUIInstagramApp.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/6/23.
//

import SwiftUI
import Firebase

@main
struct swiftUIInstagramApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
            
        }
    }
}
