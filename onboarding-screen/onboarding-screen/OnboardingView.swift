//
//  OnboardingView.swift
//  onboarding-screen
//
//  Created by Jeremy's Macbook Pro 16 on 6/26/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    var subviews = [
        UIHostingController(rootView: Subview(imageString: "meditating")),
        UIHostingController(rootView: Subview(imageString: "skydiving")),
        UIHostingController(rootView: Subview(imageString: "sitting"))
    ]
    
    var titles = [
        "Take some time out",
        "Conquer personal hindrances",
        "Crate a peaceful mind"
    ]
    
    var captions = [
        "Take your time out and bring awarness into your everyday life",
        "Meditating helps you deal with anxiety and other psychic problems",
        "Regular meditation sessions creates a peaceful inner mind"
    ]
    
    @State private var currentPageIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            PageViewController(viewControllers: subviews, currentPageIndex: $currentPageIndex)
                .frame(height: 600.0)
            
            Group {
                Text(titles[currentPageIndex])
                    .font(.title)
                Text(captions[currentPageIndex])
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 300.0, height: 50.0, alignment: .leading)
                    .lineLimit(nil)
            }
            .padding()
            
            HStack {
                PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                
                Button(action: {
                    if self.currentPageIndex + 1 == self.subviews.count {
                        self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30.0, height: 30.0)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(30)
                }
            }.padding()
            
            
            
        }
    }
    
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
