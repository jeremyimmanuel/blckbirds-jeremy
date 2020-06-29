//
//  Subview.swift
//  onboarding-screen
//
//  Created by Jeremy's Macbook Pro 16 on 6/26/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct Subview: View {
    
    var imageString: String
    
    var body: some View {
        Image(imageString)
        .resizable()
        .scaledToFill()
        .clipped()
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(imageString: "meditating")
    }
}
