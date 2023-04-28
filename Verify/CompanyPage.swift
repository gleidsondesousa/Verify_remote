//
//  CompanyPage.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/28/23.
//

import SwiftUI

struct CompanyPage: View {
    var body: some View {
        Link("Bright Expert Website", destination: URL(string: "https://gleidsonjr23.github.io/brightexpert.github.io/index.html")!)
            .bold()
            .frame(width: 280, height: 50)
            .foregroundColor(.white)
            .background(Color.brown)
            .cornerRadius(12)
            .scaledToFit()
    }
}

struct CompanyPage_Previews: PreviewProvider {
    static var previews: some View {
        CompanyPage()
    }
}
