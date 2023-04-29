//
//  VerifyApp.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/22/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct VerifyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var propertyVM = PropertyViewModel()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(propertyVM)
        }
    }
}
