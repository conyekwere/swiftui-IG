//
//  MainTabView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @Binding var selectingIndex: Int
    var body: some View {
        NavigationView {
            TabView(selection: $selectingIndex){
                FeedView()
                    .onTapGesture {
                        selectingIndex = 0
                    }
                    .tabItem{
                        Image(systemName: "house")
                    }.tag(0)
                SearchView()
                    .onTapGesture {
                        selectingIndex = 1
                    }
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                UploadPostView(tabIndex: $selectingIndex)
                    .onTapGesture {
                        selectingIndex = 2
                    }
                    .tabItem{
                        Image(systemName: "plus.square")
                    }.tag(2)
                NotificationView()
                    .onTapGesture {
                        selectingIndex = 3
                    }
                    .tabItem{
                        Image(systemName: "heart")
                    }.tag(3)
                ProfileView(user: user)
                    .onTapGesture {
                        selectingIndex = 4
                    }
                    .tabItem{
                        Image(systemName: "person.circle")
                    }.tag(4)
            }
            .accentColor(.black)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(tabTitle)
            .navigationBarItems(leading: logoutButton)
        }
    }
    var logoutButton: some View {
        Button(action: {
            AuthViewModel.shared.signout()
        }, label: {
            Text("logout")
            Image(systemName: "gearshape.fill")
                .foregroundColor(.black)
        })
    }
    var tabTitle:String{
        switch selectingIndex{
        case 0 : return "Feed"
        case 1 : return "Explore"
        case 2 : return "New Post"
        case 3 : return "Notifications"
        case 4 : return "Profile"
        default: return ""
        }
    }
}

