//
//  CommentCell.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/17/23.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: "https://source.unsplash.com/random/?profile")){ image in
                image.resizable()
                } placeholder: {
                ProgressView()
                }
                .scaledToFill()
                .frame(width: 36, height: 36 )
                .clipShape(Circle())
            
            Text("John Lee").font(.system(size: 14, weight: .semibold)) +
                Text(" Some test comment for now").font(.system(size: 14))
            
            Spacer()
            
            Text("3m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
