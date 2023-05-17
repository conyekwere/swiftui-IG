//
//  UserListView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<10){ _ in
                    NavigationLink(destination: ProfileView() , label: {UserCell()
                        .padding(.leading)})
                    
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
