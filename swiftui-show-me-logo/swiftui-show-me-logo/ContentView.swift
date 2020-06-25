//
//  ContentView.swift
//  swiftui-show-me-logo
//
//  Created by Jeremy's Macbook Pro 16 on 6/24/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showLogo: Bool = false
    
    func toggleShowLogo() {
        self.showLogo.toggle()
    }
    
    var body: some View {
        VStack (spacing: 50){
            if showLogo {
                Image("swiftui-logo")
                    .resizable()
                    .frame(width: 170.0, height: 170.0)
                    .clipped()
                    .aspectRatio(contentMode: .fill)
                    .padding(.top, 180)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 10.0) {
                Text("My First SwiftUI App")
                .font(.largeTitle)
                .foregroundColor(.blue)
                
                Text("SwiftUI makes developing iOS apps super easy and fast.")
            }
            .frame(width: 300.0, height: 100.0)
            
            LogoButton(showIcon: $showLogo, handler: self.toggleShowLogo)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LogoButton: View {
    
    @Binding var showIcon: Bool
    var handler: () -> Void
    
    var body: some View {
        Button("Show me the logo!", action: handler)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.bottom, 130)
    }
}
