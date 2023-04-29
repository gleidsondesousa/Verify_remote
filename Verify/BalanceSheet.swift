//
//  BalanceSheet.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/28/23.
//

import SwiftUI

struct BalanceSheet: View {
    @State private var expense1 = ""
    @State private var income1 = ""
    @State private var expense2 = ""
    @State private var income2 = ""
    @State private var expense3 = ""
    @State private var income3 = ""
    @State private var expense4 = ""
    @State private var income4 = ""
    @State private var expense5 = ""
    @State private var income5 = ""
    @State private var expense6 = ""
    @State private var income6 = ""
    @State private var expense7 = ""
    @State private var income7 = ""
    @State private var expense8 = ""
    @State private var income8 = ""
    @State private var expense9 = ""
    @State private var income9 = ""
    @State private var expense10 = ""
    @State private var income10 = ""
    
    @State private var net = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Group {
                Text("Balance Sheet")
                    .bold()
                    .font(.title)
                    .foregroundColor(.teal)
                
                HStack {
                    TextField("+", text: $income1)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    
                    TextField("-", text: $expense1)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
                HStack {
                    TextField("+", text: $income2)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    
                    TextField("-", text: $expense2)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
                HStack {
                    TextField("+", text: $income3)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    
                    TextField("-", text: $expense3)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
                
                HStack {
                    TextField("+", text: $income4)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    TextField("-", text: $expense4)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
            }
            Group {
                HStack {
                    TextField("+", text: $income5)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    TextField("-", text: $expense5)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
                
                HStack {
                    TextField("+", text: $income6)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    TextField("-", text: $expense6)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
                HStack {
                    TextField("+", text: $income7)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    TextField("-", text: $expense7)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
                HStack {
                    TextField("+", text: $income8)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    TextField("-", text: $expense8)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
                HStack {
                    TextField("+", text: $income9)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    TextField("-", text: $expense9)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
                HStack {
                    TextField("+", text: $income10)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                    TextField("-", text: $expense10)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 140)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 2)
                        }
                }
            }
            
            Spacer()
            
            TextField("Net", text: $net)
                .textFieldStyle(.roundedBorder)
                .frame(width: 290)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 2)
                }
            Spacer()
            
        }
        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .accentColor(Color.black)
//        .background(Color.mint)
    }
}

struct BalanceSheet_Previews: PreviewProvider {
    static var previews: some View {
        BalanceSheet()
    }
}
