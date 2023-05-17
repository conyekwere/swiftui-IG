//
//  MainTabView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView{
                FeedView()
                    .tabItem{
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }
                UploadPostView()
                    .tabItem{
                        Image(systemName: "plus.square")
                    }
                NotificationView()
                    .tabItem{
                        Image(systemName: "heart")
                    }
                ProfileView()
                    .tabItem{
                        Image(systemName: "person.circle")
                    }
            }
            .accentColor(.black)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
