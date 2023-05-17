//
//  NotificationCell.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/8/23.
//

import SwiftUI
private let frameSize:CGFloat = 40
struct NotificationCell: View {
    @State private var showPostImage = true
    var body: some View {
        HStack(alignment:.center){
        // image
        AsyncImage(url: URL(string: "https://source.unsplash.com/random/?asian")){ image in
            image.resizable()
            } placeholder: {
            ProgressView()
            }
            .scaledToFill()
            .frame(width: frameSize, height: frameSize)
            .clipShape(Circle())
            .clipped()
            
            
            if showPostImage {
                
                
                    Text("Johnathan Park Zhou")
                        .font(.system(size: 14, weight: .semibold)) +
                    Text(" liked one of your post")
                    .font(.system(size: 14)) +
                    Text(" 1d")
                        .font(.system(size: 14))
                    .foregroundColor(Color(.systemGray))
              

                Spacer()
                AsyncImage(url: URL(string: "https://source.unsplash.com/random/?beauty")){ image in
                    image.resizable()
                    
                } placeholder: {
                    ProgressView()
                }  .scaledToFill()
                    .frame( width: frameSize, height: frameSize)
                    .clipped()
            }
            else{
                Text("Horan Xiu")
                    .font(.system(size: 14, weight: .semibold)) + Text(" would like to follow you.")
                    .font(.system(size: 14)) + Text(" 1d")
                    .font(.system(size: 14))
                    .foregroundColor(Color(.systemGray))
                

                Spacer()
                Button(action:{}, label: {
                    Text("Follow")
                        .padding(.horizontal,20)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }.padding(.horizontal)
            
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
