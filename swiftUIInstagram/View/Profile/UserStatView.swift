//
//  UserStatView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/8/23.
//

import SwiftUI

struct UserStatView:View {
    let value: Int
    let title: String
    var body: some View{
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            Text((title))
                .font(.system(size: 15))
              
            
        }.frame(width: 70, alignment: .center)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 1, title: "Post")
    }
}
