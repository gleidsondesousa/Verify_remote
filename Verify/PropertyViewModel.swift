//
//  PropertyViewModel.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/23/23.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import UIKit

class PropertyViewModel: ObservableObject {
    @Published var thisProperty = Property()
    
    func getImageURL(id: String) async -> URL? {
        let storage = Storage.storage()
        let storageRef = storage.reference().child("\(id)/image.jpg")
        
        do {
            let url = try await storageRef.downloadURL()
            return url
        } catch {
            return nil
        }
    }
    
//    func saveImage(property: Property, photo: Photo, image: UIImage) async -> Bool {
//        guard let propertyID = property.id else {
//            print("😡 ERROR: property.id == nil")
//            return false
//        }
//
//        var photoName = UUID().uuidString
//        if photo.id != nil {
//            photoName = photo.id!
//        }
//        let storage = Storage.storage()
//        let storageRef = storage.reference().child("\(propertyID)/\(photoName).jpeg")
//
//        guard let resizedImage = image.jpegData(compressionQuality: 0.2) else {
//            print("😡ERROR: Could not resize image")
//            return false
//        }
//
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpg"
//
//        var imageURLString = ""
//
//        do {
//            let _ = try await storageRef.putDataAsync(resizedImage, metadata: metadata)
//            print("📸 Image Saved!")
//            do {
//                let imageURL = try await storageRef.downloadURL()
//                imageURLString = "\(imageURL)"
//            } catch {
//                print("😡 ERROR: Could not get imageURL after saving image \(error.localizedDescription)")
//                return false
//            }
//        } catch {
//            print("😡 ERROR: uploading image to FirebaseStorage")
//            return false
//        }
//
//        let db = Firestore.firestore()
//        let collectionString = "properties/\(propertyID)/photos"
//
//        do {
//            var newPhoto = photo
//            newPhoto.imageURLString = imageURLString
//            try await db.collection(collectionString).document(photoName).setData(newPhoto.dictionary)
//            print("😎 Data updated successfully!")
//            return true
//        } catch {
//            print("😡 ERROR: Could not update data in 'photos' for propertyID \(propertyID)")
//            return false
//        }
//    }
    func saveImage(id: String, image: UIImage) async {
        let storage = Storage.storage()
        let storageRef = storage.reference().child("\(id)/image.jpg")

        let resizedImage = image.jpegData(compressionQuality: 0.2)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"

        if let resizedImage = resizedImage {
            do {
                let metadata = try await storageRef.putDataAsync(resizedImage)
                print("Metadata: ", metadata)
                print("📸 Image Saved!")
            } catch {
                print("😡 ERROR: uploading image to FirebaseStorage \(error.localizedDescription)")
            }
        }
    }
    
    func deleteData(thisProperty: Property) async {
        let db = Firestore.firestore()
        guard let id = thisProperty.id else {
            print("😡 ERROR: id was nil. This should not have happened!")
            return
        }
        
        do {
            let _ = try await db.collection("properties").document(id).delete()
            print("🗑 Document successfully removed!")
            return
        } catch {
            print("😡 ERROR: removing document: \(error.localizedDescription)")
            return
        }
    }
    
    func saveProperty(thisProperty: Property) async -> Bool {
        let db = Firestore.firestore()
        
        if let id = thisProperty.id {
            do {
                try await db.collection("properties").document(id).setData(thisProperty.dictionary) //TODO: add code to append notes and total to dictionary so that it saves in the cloud, and not just address and purchases
                print("😎 Data updated successfully")
                return true
            } catch {
                print("😡 ERROR: Could not update data in 'properties' \(error.localizedDescription)")
                return false
            }
        } else {
            do {
                try await db.collection("properties").addDocument(data: thisProperty.dictionary)
                print("🐣 Data added successfully")
                return true
            } catch {
                print("😡 ERROR: Could not create a new property in 'properties' \(error.localizedDescription)")
                return false
            }
        }
    }
}
