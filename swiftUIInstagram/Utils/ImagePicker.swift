//
//  ImagePicker.swift
//  swiftUIInstagram
//
//  Created by Chima onyekwere on 5/14/23.
//

import SwiftUI



// outupdated verison and is slower


//struct ImagePicker: UIViewControllerRepresentable{
//    @Binding var image: UIImage?
//
//    @Environment(\.presentationMode) var mode
//    func makeUIViewController(context: Context) -> some UIViewController {
//        let picker = UIImagePickerController()
//                picker.delegate = context.coordinator
//        return picker
//    }
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//
//    class Coordinator: NSObject, UINavigationControllerDelegate,UIImagePickerControllerDelegate{
//        let parent : ImagePicker
//
//        init (_ parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            // store image after selection
//            guard let image = info[.originalImage] as? UIImage else {return}
//            self.parent.image = image
//            self.parent.mode.wrappedValue.dismiss()
//        }
//    }
//}




import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}
