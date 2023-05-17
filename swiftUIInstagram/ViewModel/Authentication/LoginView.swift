//
//  LoginView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/14/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple,Color.blue,]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack{
                  Image("text-logo")
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
