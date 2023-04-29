//
//  CompanyPage.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/28/23.
//

import SwiftUI

struct CompanyPage: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("bright")
                .resizable()
                .scaledToFit()
            
            Spacer()
            
            Link("Bright Expert Website", destination: URL(string: "https://gleidsonjr23.github.io/brightexpert.github.io/index.html")!)
                .bold()
                .frame(width: 350, height: 100)
                .foregroundColor(.white)
                .background(Color.teal)
                .cornerRadius(12)
            
            Spacer()
        }
    }
}

struct CompanyPage_Previews: PreviewProvider {
    static var previews: some View {
        CompanyPage()
    }
}
