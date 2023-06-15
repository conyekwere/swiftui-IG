//
//  TextArea.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/14/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            TextEditor(text: $text)
                .padding(4)
                .background(Color.white.opacity(0))
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
    
        }
        .font(.body)
    }
}
