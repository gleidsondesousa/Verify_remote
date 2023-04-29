//
//  WebView.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/27/23.
//

import SwiftUI

struct WebView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("Explore Pricing")
                .bold()
                .font(.title)
                .foregroundColor(.white)
            
            Spacer()
            
            HStack {
                
                Image("homedepot")
                    .resizable()
                    .scaledToFit()
                
                Link("Home Depot", destination: URL(string: "https://www.homedepot.com/?mtc=SEM-BF-CDP-GGL-Multi-Multi-NA-Multi-NA-ETA-NA-NA-NA-NA-BT1-NA-NA-NA-THD&cm_mmc=SEM-BF-CDP-GGL-Multi-Multi-NA-Multi-NA-ETA-NA-NA-NA-NA-BT1-NA-NA-NA-THD-71700000002449093-58700000047538642-43700003817116350&ds_rl=5041&gclid=CjwKCAjwuqiiBhBtEiwATgvixL8I-wZOAAfTRy0nI24iQnz_CdaQI_06lPlhFqH5bEAfpWwz46pfMhoCBG8QAvD_BwE&gclsrc=aw.ds")!)
                    .bold()
                    .frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(12)
            }
            
            HStack {
                
                Image("lowes")
                    .resizable()
                    .scaledToFit()
                
                Link("Lowe's", destination: URL(string: "https://www.lowes.com/?cm_mmc=src-_-c-_-brd-_-mdv-_-ggl-_-Brand-Core_Exact-_-lowes-_-0-_-0-_-0&ds_rl=1286887&gclid=CjwKCAjwuqiiBhBtEiwATgvixOuHujrnG9SvQytEDqOUylLxjsm_6qHwcfINxxVe6qhYTctOLNAqohoCCQQQAvD_BwE&gclsrc=aw.ds")!)
                    .bold()
                    .frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(Color.indigo)
                    .cornerRadius(12)
            }
            
            HStack {
                Image("benjamin")
                    .resizable()
                    .scaledToFit()
                
                Link("Benjamin Moore", destination: URL(string: "https://www.benjaminmoore.com/en-us?gclid=Cj0KCQjw3a2iBhCFARIsAD4jQB2RMU7maP80ujHr97KZ0iPOfWKPw_aaBOhUbUjul9H8cT0YJyZMkz4aAv5CEALw_wcB&gclsrc=aw.ds")!)
                    .bold()
                    .frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            
            HStack {
                Image("ace")
                    .resizable()
                    .scaledToFit()
                
                Link("Ace Hardware", destination: URL(string: "https://www.acehardware.com/?utm_source=google&utm_medium=cpc&gclid=Cj0KCQjwgLOiBhC7ARIsAIeetVBYlMWUHu-f4DXvBVquImDQU9NHURo6wSTayOXGx7ZJJe_vH91SHWYaAmbeEALw_wcB&gclsrc=aw.ds")!)
                    .bold()
                    .frame(width: 250, height: 50)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(12)
            }
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.teal)
        
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
