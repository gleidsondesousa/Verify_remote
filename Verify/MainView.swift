//
//  MainView.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/27/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            PropertiesListView()
                .tabItem {
                    Label("Records", systemImage: "camera.badge.ellipsis")
                }
            WebView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            CompanyPage()
                .tabItem {
                    Label("Company", systemImage: "ellipsis")
                }
            BalanceSheet()
                .tabItem {
                    Label("Balance", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
