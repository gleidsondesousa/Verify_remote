//
//  PropertyDetailView.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/23/23.
//

import SwiftUI
import MapKit
import FirebaseFirestoreSwift
import PhotosUI

struct PropertyDetailView: View {
    
    @EnvironmentObject var propertyVM: PropertyViewModel
    @State var property: Property
    
    @State private var selectedImage: Image = Image(systemName: "photo")
    @State private var selectedPhoto: PhotosPickerItem?
    @Environment(\.dismiss) private var dismiss

    @State private var imageURL: URL?
    
    var body: some View {
        VStack {
            Group {
                TextField("Address", text: $property.address)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                    .padding(.horizontal)
                
                DatePicker("Purchase Date", selection: $property.purchaseDate)
                    .listRowSeparator(.hidden)
                    .padding(.vertical)
                    .padding(.bottom)
                    .padding(.horizontal)

                Text("Notes:")
                TextField("Notes", text: $property.notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                    .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    Text("Receipt:")
                        .bold()
                    Spacer()
                    
                    PhotosPicker(selection: $selectedPhoto, matching: .images, preferredItemEncoding: .automatic) {
                        Image(systemName: "photo")
                        Text("Photo")
//                        Label("", systemImage: "photo.fill.on.rectangle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .bold()
                    .tint(.brown)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    
                    .onChange(of: selectedPhoto) { newValue in
                        Task {
                            do {
                                if let data = try await newValue?.loadTransferable(type: Data.self) {
                                    if let uiImage = UIImage(data: data) {
                                        selectedImage = Image(uiImage: uiImage)
                                        imageURL = nil
                                    }
                                }
                            } catch {
                                print("😡 ERROR: loading failed \(error.localizedDescription)")
                            }
                        }
                    }
                }
                
                if imageURL != nil {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    selectedImage
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                }
                
                Text("Total:")
                    .padding(.top)
                    .font(.title2)
                    .padding(.horizontal)
                
                TextField("Total", text: $property.total, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                    .padding(.horizontal)
            }
        // TODO: Remember to Enable
//            .disabled(property.id == nil ? false : true)
            
            Spacer()
        }
        .task {
            if let id = property.id {
                if let url = await propertyVM.getImageURL(id: id) {
                    imageURL = url
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(property.id == nil)
        .toolbar {
            if property.id == nil {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        Task {
                            let id = await propertyVM.saveProperty(property: property)
                            if id != nil { // save worked!
                                property.id = id
                                await propertyVM.saveImage(id: property.id ?? "", image: ImageRenderer(content: selectedImage).uiImage ?? UIImage() )
                                dismiss()
                            } else { // did not save
                                print("😡 DANG! Error saving!")
                            }
                        }
                    }
                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Save") {
//                        Task {
//                            let success = await propertyVM.saveProperty(property: property)
//                            if success {
////                            let id = await propertyVM.saveProperty(property: property)
////                            if id != nil {
////                                property.id = id
//                                await propertyVM.saveImage(id: property.id ?? "", image: ImageRenderer(content: selectedImage).uiImage ?? UIImage())
//                                dismiss()
//                            } else {
//                                print("😡Dang! Error saving spot!")
//                            }
//                        }
//                        dismiss()
//                    }
//                }
            }
        }
    }
}

struct PropertyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PropertyDetailView(property: Property())
                .environmentObject(PropertyViewModel())
        }
    }
}
