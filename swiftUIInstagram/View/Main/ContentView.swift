//
//  ContentView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group{
            if viewModel.userSession == nil  {
                LoginView()
            }
            else {
                if let user  = viewModel.currentUser{
                    MainTabView(user: user, selectingIndex: $selectedIndex)
                }
                // define user for profile and type check that a user is loged in
                // the issue is that this is saved only when you leave the app 
            }
            // if not logged in show login
            // else show main interface
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
