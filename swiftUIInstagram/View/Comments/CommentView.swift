//
//  CommentView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/17/23.
//

import SwiftUI

struct CommentView: View {
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel

    init(post:Post) {
        self.viewModel = CommentViewModel(post:post)
    }
    var body: some View {
        VStack {
            // comment cells
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 24){
                    ForEach(viewModel.commets) { comment in
                        CommentCell(comment:comment)
                    }
                    
                }
            }.padding(.top)
            CustomInputView(inputView: $commentText, sendAction: uploadComment)
            // input view
            
        }
    }
    func uploadComment(){
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}

