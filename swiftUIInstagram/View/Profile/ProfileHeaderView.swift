//
//  ProfileHeaderView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/8/23.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    var viewPadding:CGFloat = 24
    private let viewHeight = UIScreen.main.bounds.height / 3
    @ObservedObject var  viewModel: ProfileViewModel
    var body: some View {
        LazyVStack(alignment:.leading) {
            HStack() {
                ZStack {
                    KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    
                    if viewModel.user.isCurrentUser {
                        Circle()
                            .frame(width:30, height: 30)
                            .foregroundColor(Color(.white))
                            .offset(x: 25, y: 25)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                        
                            .foregroundColor(Color(.systemBlue))
                            .font(.system(size: 25))
                            .offset(x: 25, y: 25)
                            .frame(width:25, height: 25)
                    }
                    
                }
                
                
                Spacer()
                HStack(spacing: 16) {
                    
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Posts")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                    
                }
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 18, weight: .semibold))
                .frame( height: 30)
            Text("Social Good")
                .font(.system(size: 18))
                .frame( height: 10)
                .padding(.bottom,viewPadding)
            
            ProfileActionButtonView(viewModel: viewModel)
            
        }.padding(.horizontal,viewPadding)
    }
}
