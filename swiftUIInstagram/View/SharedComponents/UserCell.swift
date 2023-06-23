//
//  UserCell.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        HStack(alignment: .top) {
        // image
            KFImage(URL(string: user.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            .clipped()
            
        // VStack -> username, fullname
            VStack(alignment: .leading){
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
            }.frame(alignment:.center)
            Spacer()
        }
    }
}

