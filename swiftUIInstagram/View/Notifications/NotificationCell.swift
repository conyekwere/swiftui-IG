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

    @ObservedObject var viewModel: NotificationCellViewModel

    var isFollowed: Bool {return viewModel.notification.isFollowed ?? false}
    var isCurrentUser: Bool {return viewModel.notification.user?.isCurrentUser ?? false}
    
    init(notification: Notification) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    // or init(viewModel:  NotificationCellViewModel) {self.viewModel = viewModel} but you would have to pass te same on parent class
    @State private var showPostImage = true
    var body: some View {
        
        if isCurrentUser == false {
        HStack(alignment:.center){
      
            
            if let user = viewModel.notification.user{
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: frameSize, height: frameSize)
                        .clipShape(Circle())
                        .clipped()
                    VStack(spacing:0){
                        Text(viewModel.notification.username)
                            .font(.system(size: 14, weight: .semibold)) +
                        Text(" \(viewModel.notification.type.notificationMessage)")
                        
                            .font(.system(size: 14)) +
                        Text(" \(viewModel.timestampString)")
                            .font(.system(size: 14))
                            .foregroundColor(Color(.systemGray))
                    }.multilineTextAlignment(.leading)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .leading
                        )
                        .padding(.leading,8)
                }
            }
            
            Spacer()
            
            
            if viewModel.notification.type != .follow {
                
                if let post = viewModel.notification.post{
                    NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))){
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame( width: frameSize, height: frameSize)
                            .clipped()
                    }
                }
                
            }
            else {
                
                Button(action:{isFollowed ? viewModel.unfollow() : viewModel.follow()},
                       label: {
                    
                    Text(isFollowed ? "Following" : "Follow")
                        .padding(.horizontal,20)
                        .padding(.vertical,8)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color(.systemGray6) : Color(.systemBlue))
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .font(.system(size: 14, weight: .semibold))
                    
                })
            }
        }.padding(.horizontal)
        }
    }
}
