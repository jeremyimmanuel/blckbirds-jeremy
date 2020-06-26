//
//  Food.swift
//  food-delivery
//
//  Created by Jeremy's Macbook Pro 16 on 6/24/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import Foundation
import SwiftUI

class Food: Identifiable {
    let id: Int
    let title: String
    let price: Double
    let category: Categories
    
    init(title: String, price: Double, category: Categories, id: Int) {
        self.id = id
        self.title = title
        self.price = price
        self.category = category
    }
}

enum Categories {
    case burger
    case pasta
    case pizza
    case dessert
}

func categoryString(for category: Categories) -> String {
    switch category {
    case .pizza:
        return "Pizza"
    case .burger:
        return "Burger"
    case .pasta:
        return "Pasta"
    case .dessert:
        return "Dessert"
    default:
        return "Bruh"
    }
}

struct Food_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
