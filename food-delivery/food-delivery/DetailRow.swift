//
//  DetailRow.swift
//  food-delivery
//
//  Created by Jeremy's Macbook Pro 16 on 6/25/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct DetailRow: View {
    
    var food: Food
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                    .padding(.top, 10)
                Text("\(food.price, specifier: "%2.2f")")
                    .font(.caption)
                
            }
            Spacer()
            Button(action: {}) {
                Text("ORDER")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(15)
            }
        }
        .padding(20)
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(food: foodData[0])
    }
}
