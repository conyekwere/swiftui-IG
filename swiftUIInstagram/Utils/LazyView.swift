//
//  LazyView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/24/23.
//

import SwiftUI

struct LazyView<Content: View>: View{
    let build:() -> Content
    
    init(_ build: @autoclosure @escaping() -> Content ){
        self.build = build
    }
    
    var body: Content{
        build()
    }
    
}


