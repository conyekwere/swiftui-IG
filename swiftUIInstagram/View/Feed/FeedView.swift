//
//  FeedView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post:post)
                }
            }.padding(.top)
        }
    }
}


