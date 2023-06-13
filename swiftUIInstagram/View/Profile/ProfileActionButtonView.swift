//
//  ProfileActionButtonView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/13/23.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed = false
    var body: some View {
        GeometryReader { geometry in
            let stackWidth = geometry.size.width 
            if viewModel.user.isCurrentUser {
                HStack(spacing:8) {
                    Button(action:{}, label: {
                        Text("Edit profile")
                    })
                    .frame( width: stackWidth/2 - 4 , height: 40)
                    .font(.system(size: 15, weight: .semibold))
                    .background(Color(.systemGray6))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    
                    
                    Button(action:{}, label: {
                        Text("Share profile")
                    })
                    .frame( width: stackWidth/2  - 4  , height: 40)
                    .font(.system(size: 15, weight: .semibold))
                    .background(Color(.systemGray6))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                }
            }
            else{
                HStack(spacing:8) {
                    Button(action:{isFollowed ? viewModel.unfollow() : viewModel.follow()}, label: {
                        Text(isFollowed ? "Following" : "Follow")
                    })
                    .frame( width: stackWidth/2 - 4 , height: 40)
                    .font(.system(size: 15, weight: .semibold))
                    .background(Color(isFollowed ? .systemGray6 : .systemBlue))
                    .foregroundColor(isFollowed ? .black : .white)
                    .cornerRadius(10)
                    
                    
                    Button(action:{}, label: {
                        Text("Message")
                    })
                    .frame( width: stackWidth/2  - 4  , height: 40)
                    .font(.system(size: 15, weight: .semibold))
                    .background(Color(.systemGray6))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    
                }
            }
        }
        
    }
}
