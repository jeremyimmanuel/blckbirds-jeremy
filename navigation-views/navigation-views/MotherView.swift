//
//  MotherView.swift
//  navigation-views
//
//  Created by Jeremy's Macbook Pro 16 on 6/26/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct MotherView: View {
//    @State private var page = "page1"
    
//    @ObservedObject var viewRouter: ViewRouter
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "page1" {
//                ContentViewA(viewRouter: viewRouter)
                ContentViewA()
            } else if viewRouter.currentPage == "page2" {
//                ContentViewB(viewRouter: viewRouter)
                ContentViewB()
                    .transition(.slide)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
//        MotherView(viewRouter: ViewRouter())
        MotherView().environmentObject(ViewRouter())
    }
}
