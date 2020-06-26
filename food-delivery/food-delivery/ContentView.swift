//
//  ContentView.swift
//  food-delivery
//
//  Created by Jeremy's Macbook Pro 16 on 6/24/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        NavigationView {
            List {
                
                NavigationLink(destination: DetailView(currentCategory: .burger)) {
                    CategoryView(categoryName: "BURGER", imageName: "burger")
                }
                NavigationLink(destination: DetailView(currentCategory: .pizza)) {
                    CategoryView(categoryName: "PIZZA", imageName: "pizza")
                }
                NavigationLink(destination: DetailView(currentCategory: .pasta)) {
                    CategoryView(categoryName: "PASTA", imageName: "pasta")
                }

                NavigationLink(destination: DetailView(currentCategory: .dessert)) {
                    CategoryView(categoryName: "DESSERT", imageName: "dessert")
                }

            }.navigationBarTitle(Text("Food Delivery"))
        }
        
        
    }
}

struct CategoryView: View {
    
    var categoryName: String
    var imageName: String
    
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Image(imageName)
                .resizable()
                .scaledToFill()
                    .frame(width: 300.0, height: 150.0)
                .clipped()
                    .cornerRadius(20)
                
                Text(categoryName)
                    .font(.custom("HelveticaNeue-Medium", size: 50))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 5)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
