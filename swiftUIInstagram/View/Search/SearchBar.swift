//
//  SearchBar.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    // monitor when text var changes
    var body: some View {
        HStack {
            TextField("Search...",text: $text)
                .padding(.horizontal, 24)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 30, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,8)
                    }
                )
                .onTapGesture {
                    isEditing = true
                }
            if isEditing {
                
                withAnimation(.easeInOut(duration: 0.5)) {
                    Button(action: {
                        isEditing = false
                        text = ""
                        UIApplication.shared.endEditing()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                    })
                        .padding(.trailing,8)
                } .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search ..."), isEditing: .constant(true))
    }
}
