//
//  UserCell.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
        // image
        AsyncImage(url: URL(string: "https://source.unsplash.com/random/?latin")){ image in
            image.resizable()
            } placeholder: {
            ProgressView()
            }
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            .clipped()
            
        // VStack -> username, fullname
            VStack(alignment: .leading){
                Text("Agrito3")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Angel Rio")
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
