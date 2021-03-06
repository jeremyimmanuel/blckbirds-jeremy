//
//  DetailView.swift
//  food-delivery
//
//  Created by Jeremy's Macbook Pro 16 on 6/25/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var currentCategory: Categories
    @State private var showOrderSheet = false
    
    var body: some View {
        List(foodData.filter({$0.category == currentCategory})) { food in
            DetailRow(food: food, showOrderSheet: self.$showOrderSheet)
        }.navigationBarTitle(Text(categoryString(for: currentCategory)), displayMode: .inline)
            .sheet(isPresented: $showOrderSheet) {
                OrderForm(showOrderSheet: self.$showOrderSheet)
        }
    }
    
    func filterData(by category: Categories) -> [Food] {
        var ans = [Food]()
        
        for food in foodData {
            if food.category == category {
                ans.append(food)
            }
        }
        
        return ans
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(currentCategory: .burger
        )
    }
}
