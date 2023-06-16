//
//  SearchViewModel.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/8/23.
//

import Foundation
import Firebase


class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var posts = [Post]()
    
    init() {
        fetchUsers()
        fetchPost()
    }
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            
            guard let documents  = snapshot?.documents  else {return}
            self.users = documents.compactMap({ try? $0.data(as: User.self)})
            
            //long form of self.users = documents.compactMap({ try? $0.data(as: User.self)})
            
//            documents.forEach { snapshot in
//                guard let user = try? snapshot.data(as: User.self)  else {return}
//                self.users.append(user)
//            }
            
            print(self.users)
        }
    }
    func fetchPost() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            
            guard let documents  = snapshot?.documents  else {return}
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
            
            print(self.posts)
        }
    }
    
    func filteredUsers(_ query: String) -> [User]{
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) })
        
        ///$0.fullname.lowercased() lowercase results as well
        ///.contains(lowercasedQuery) lowercase results
    }
}
