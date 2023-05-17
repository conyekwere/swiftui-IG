//
//  FeedCell.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment:.leading){
            // user info
            HStack{
                AsyncImage(url: URL(string: "https://source.unsplash.com/random/?afro")){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(25)
                Text("Taylor Rolome")
                    .font(.system(size: 14,weight: .semibold))
            }.padding([.leading,.bottom], 8)
            //Post image
            AsyncImage(url: URL(string: "https://source.unsplash.com/random/?,city")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .scaledToFill()
                .frame( maxHeight: 340)
                .clipped()
            //Post buttons
            HStack(spacing: 16) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
    
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                        
                })
                
                
                
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
            
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack{
                Text("John Reans")
                    .font(.system(size: 14, weight: .semibold)) +
                Text(" Wow this is an awesome photo!")
                    .font(.system(size: 15))
            } .padding(.horizontal,8)
            Text("3d")
                .foregroundColor(.gray)
                .font(.system(size: 14))
                .padding(.leading, 8)
                .padding(.top, -2)

        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
