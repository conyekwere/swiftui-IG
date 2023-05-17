//
//  NotificationView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<10){ _ in
                    NavigationLink(destination: FeedView() , label: {NotificationCell()
                        .padding(.top)})
                    
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
