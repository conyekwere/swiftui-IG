//
//  CustomInputView .swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 6/17/23.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputView: String
    var sendAction:() -> Void
    var body: some View {
        VStack{
            //divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom,8)
            // hstack with send button and text field
            HStack{
                TextField("Comment..", text: $inputView)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight:30)
                Button ( action:
                    sendAction){
                    Text("Send")
                        .foregroundColor(.black)
                        .font(.system(size:16, weight: .semibold))
                }
            }
        } .padding(.bottom, 8 )
            .padding(.horizontal)
    }
}
