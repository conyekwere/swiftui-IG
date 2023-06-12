//
//  ProfileView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct ProfileView: View {
    private let viewHeight = UIScreen.main.bounds.height / 3
    
    let user: User
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ProfileHeaderView(user:user)
                    .padding([.bottom,.top])
                    .frame(height: viewHeight - 32)
                PostGridView()
            }
        }
    }
}
