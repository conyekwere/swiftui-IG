//
//  FeedCell.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel : FeedCellViewModel

    var didLike: Bool { return viewModel.post.didLike ?? false}
    // unwrap   viewModel.post.didLike?
    init(viewModel:FeedCellViewModel){
        self.viewModel = viewModel
        
    }

    
    var body: some View {
        
            VStack(alignment:.leading){
                // user info
                HStack{
                    if let user = viewModel.post.user  {
                        NavigationLink(destination:  LazyView(ProfileView(user: user))) {
                            
                            KFImage(URL(string:  viewModel.post.ownerImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 36, height: 36)
                                .clipped()
                                .cornerRadius(25)
                            Text(viewModel.post.ownerUsername)
                                .font(.system(size: 14,weight: .semibold))
                        }
                        
                    }
                    
                }.padding([.leading,.bottom], 8)
                //Post image
                KFImage(URL(string:  viewModel.post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame( maxWidth: 430, maxHeight: 340)
                    .clipped()
                //Post buttons
                HStack(spacing: 16) {
                    Button(action: {
                        didLike ? viewModel.unlike() : viewModel.like()
                    }, label: {
                        Image(systemName: didLike ? "heart.fill" : "heart")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(didLike ? .red : .black )
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                        
                    })
                    
                    
                    NavigationLink(destination:  LazyView(CommentView(post:viewModel.post))){
                        Image(systemName: "bubble.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                    }
                    
                    
                    
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "paperplane")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                    })
                }.foregroundColor(.black)
                    .padding(.leading, 4)
                
                //caption
                
                Text(viewModel.likeString)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
                
                HStack{
                    Text(viewModel.post.ownerUsername)
                        .font(.system(size: 14, weight: .semibold)) +
                    Text(" \(viewModel.post.caption)")
                        .font(.system(size: 15))
                } .padding(.horizontal,8).lineLimit(1)
                Text(viewModel.timestampString)
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .padding(.leading, 8)
                    .padding(.top, -2)
                
            }
        }
    }

