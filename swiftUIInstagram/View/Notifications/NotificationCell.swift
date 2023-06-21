//
//  NotificationCell.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/8/23.
//

import SwiftUI

import Kingfisher


private let frameSize:CGFloat = 40
struct NotificationCell: View {
    let notification : Notification
    @State private var showPostImage = true
    var body: some View {
        HStack(alignment:.center){
        // image

        KFImage(URL(string: notification.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: frameSize, height: frameSize)
            .clipShape(Circle())
            .clipped()
            VStack(spacing:0){
                Text(notification.username)
                    .font(.system(size: 14, weight: .semibold)) +
                Text(" \(notification.type.notificationMessage)")
                
                    .font(.system(size: 14)) +
                Text(" 1d")
                
                    .font(.system(size: 14))
                    .foregroundColor(Color(.systemGray))
            }

                Spacer()
            if notification.type != .follow {
                KFImage(URL(string: notification.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame( width: frameSize, height: frameSize)
                    .clipped()
            }
            else {

                Button(action:{}, label: {
                    Text("Follow")
                        .padding(.horizontal,20)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }.padding(.horizontal)
            
    }
}
