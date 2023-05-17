//
//  PostGridView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(),GridItem(),GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0 ..< 10) {_ in
                NavigationLink(destination: FeedView() , label: {
                    AsyncImage(url: URL(string: "https://source.unsplash.com/random/?african")){ image in
                        image.resizable()
                        
                    } placeholder: {
                        ProgressView()
                    }  .scaledToFill()
                        .frame( width: width, height: width)
                        .clipped()
                    
                })
            }

        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
