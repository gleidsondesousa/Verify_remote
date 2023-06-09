//
//  PropertiesListView.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/23/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct PropertiesListView: View {
    @EnvironmentObject var propertyVM: PropertyViewModel
    @FirestoreQuery(collectionPath: "properties") var properties: [Property]
    @State private var sheetIsPresented = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(properties) { property in
                    NavigationLink {
                        PropertyDetailView(property: property)
                    } label: {
                        Text(property.address)
                    }
                }
                .onDelete { indexSet in
                    guard let index = indexSet.first else {return}
                    Task {
                        await propertyVM.deleteData(property: properties[index])
                    }
                }
            }
            .font(.title2)
            .listStyle(.insetGrouped)
            .navigationTitle("Properties")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Sign Out") {
                        do {
                            try Auth.auth().signOut()
                            print("🪵➡️ Log out successful!")
                            dismiss()
                        } catch {
                            print("😡 ERROR: Could not sign out!")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .status) {
                    Text("Number of Properties: \(properties.count)")
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    PropertyDetailView(property: Property())
                }
            }
        }
    }
    
}

struct PropertiesListView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesListView()
    }
}
