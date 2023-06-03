//
//  ContentView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession == nil  {
                LoginView()
            }
            else {
                MainTabView()
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
