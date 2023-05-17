//
//  UploadPostView.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/7/23.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage:UIImage?
    @State var postImage: Image?
    @State var captionText = ""

    @State var imagePickerPresented = false
    var body: some View {
        
        
 
        VStack {
            if postImage == nil {
                Button(action:{imagePickerPresented.toggle() },label:{
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top,56)
                        .foregroundColor(Color(.systemGray))
                    
                }).sheet(isPresented: $imagePickerPresented, onDismiss: {
                    loadImage()
                },  content: {ImagePicker(image:$selectedImage)})
                
                //to link varibles between files create a state varible the binds to a binding verible in another file
                
                // similar to creating a protocol and passing pack to view controller with a delegate
                
            }
            else if let imagePosted = postImage{
                // same as if postImage but with a definied variable
                HStack(alignment: .top){
                    imagePosted
                        .resizable()
                        .scaledToFill()
                        .frame( width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption.", text: $captionText)
                    
                }.padding()
                GeometryReader { geometry in
                    let stackWidth = geometry.size.width
                    HStack(spacing:14){
                        
                        Button ( action: {
                            
                        },label: {
                            Text("Share")
                                .font(.system(size:16, weight: .semibold))
                                .frame( width: stackWidth/2 - 24 , height: 40)
                                .background(Color(.systemBlue))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                            
                        })
                        
                        
                        Button ( action: {
                            postImage = nil
                            
                        },label: {
                            Text("Cancel")
                                .font(.system(size:16, weight: .semibold))
                                .frame( width: stackWidth/2 - 24 , height: 40)
                                .background(Color(.systemGray6))
                                .foregroundColor(.black)
                                .cornerRadius(5)
                            
                        })
                    }.padding(.horizontal,16)
                    
                }
            }
            Spacer()
 
        }
  
        
    }
    
}
extension UploadPostView{
    func loadImage(){
        /// when closing picker  grab selectedImage image from imageicker and place as post image
        guard let selectedImage = selectedImage else{ return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}

