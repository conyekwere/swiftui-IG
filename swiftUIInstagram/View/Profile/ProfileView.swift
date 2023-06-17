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
    @ObservedObject var viewModel: ProfileViewModel
    // cant do this need too put user in init @ObservedObject var viewModel = ProfileViewModel(user: user)
    init(user:User){
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        
    }
    var body: some View {
        ScrollView{
            LazyVStack{
                ProfileHeaderView(viewModel:viewModel)
                    .padding([.bottom,.top])
                    .frame(height: viewHeight - 32)
              //  PostGridView(viewModel:viewModel) 
            }
        }
    }
}
