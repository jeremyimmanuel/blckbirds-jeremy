//
//  PageControl.swift
//  onboarding-screen
//
//  Created by Jeremy's Macbook Pro 16 on 6/27/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    
    @Binding var currentPageIndex: Int
    
    func makeUIView(context: Context) -> some UIView {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = UIColor.orange
        control.pageIndicatorTintColor = UIColor.gray
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
    }
}
