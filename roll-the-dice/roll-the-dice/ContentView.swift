//
//  ContentView.swift
//  roll-the-dice
//
//  Created by Jeremy's Macbook Pro 16 on 6/25/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var rolledNumber = 1
    
    @State private var rolledIt = false
    
    var body: some View {
        VStack {
            Image(rolledIt ? "\(rolledNumber)" : "unknown")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .scaledToFit()
                .clipped()
                .padding(.top, 250)
            Spacer()
            Button(action: {
                let randomNumber = Int.random(in: 1..<7)
                self.rolledNumber = randomNumber
                self.rolledIt = true
            }) {
                RollButtonContent()
            }
            .padding(.bottom, 40)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RollButtonContent: View {
    var body: some View {
        Text("Roll the dice")
            .frame(width: 240.0, height: 75.0)
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.orange)
            .cornerRadius(20)
    }
}
