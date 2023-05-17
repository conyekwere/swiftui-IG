//
//  ProfileView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct ProfileView: View {
    private let viewHeight = UIScreen.main.bounds.height / 3
    var body: some View {
        ScrollView{
            LazyVStack{
                ProfileHeaderView()
                    .padding([.bottom,.top])
                    .frame(height: viewHeight - 32)
                PostGridView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
