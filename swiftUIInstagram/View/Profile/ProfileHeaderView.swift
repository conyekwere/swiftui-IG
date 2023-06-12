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
    let user: User
    var body: some View {
        LazyVStack(alignment:.leading) {
            HStack() {
                ZStack {
                    KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    
                    if user.isCurrentUser {
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
                    
                    UserStatView(value: 10, title: "Posts")
                    UserStatView(value: 40, title: "Followers")
                    UserStatView(value: 30, title: "Following")
                }
            }
            
            Text(user.fullname)
                .font(.system(size: 18, weight: .semibold))
                .frame( height: 30)
            Text("Social Good")
                .font(.system(size: 18))
                .frame( height: 10)
                .padding(.bottom,viewPadding)
            
            ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
            
        }.padding(.horizontal,viewPadding)
    }
}
