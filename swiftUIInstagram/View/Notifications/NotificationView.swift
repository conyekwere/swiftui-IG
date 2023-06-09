//
//  NotificationView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                
                if viewModel.notifications.isEmpty {
                    EmptyNotification()
                } else {
                    ForEach(viewModel.notifications){ notification in
                         NotificationCell(notification: notification)
                            .padding(.top)}
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
