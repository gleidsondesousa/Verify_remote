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
                    Label("Properties", systemImage: "list.dash")
                }
            
            WebView()
                .tabItem {
                    Label("Search", systemImage: "square.and.pencil")
                }
            CompanyPage()
                .tabItem {
                    Label("Company", systemImage: "house")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
