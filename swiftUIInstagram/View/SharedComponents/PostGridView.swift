//
//  PostGridView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    private let items = [GridItem(),GridItem(),GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfig
    @ObservedObject var viewModel: PostGridViewModel
    // init = PostGridViewModel() instead of an instance : PostGridViewModel()  so that you don't have to place viewModel: viewModel in Parent view
    
    init(config: PostGridConfig) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(viewModel.posts) {post in
                NavigationLink(destination: FeedView() , label: {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame( width: width, height: width)
                        .clipped()
                    
                })
            }
            
        }
    }
}

