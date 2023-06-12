//
//  SearchView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct SearchView: View {
    @State var inSeachMode = false
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    var body: some View {
        ScrollView {
            //search bar
            SearchBar(text: $searchText, isEditing: $inSeachMode)
                .padding()
            //grid view/ user list view
            ZStack(){
                if inSeachMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
