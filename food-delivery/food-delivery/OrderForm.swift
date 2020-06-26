//
//  OrderForm.swift
//  food-delivery
//
//  Created by Jeremy's Macbook Pro 16 on 6/26/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct OrderForm: View {
    
    @State private var specialRequests = false
    @State private var specialRequestContent = ""
    @State private var orderAmount = 1
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var streetAddress = ""
    @State private var city = ""
    @State private var zip = ""
    
    @State private var userFeedback = 0.0
    
    @Binding var showOrderSheet: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle(isOn: $specialRequests) {
                        Text("Any special requests?")
                    }
                    
                    if specialRequests {
                        TextField("Enter your wishes", text: $specialRequestContent)
                    }
                    Stepper(value: $orderAmount, in: 1...10) {
                        Text("Number of items: \(orderAmount)")
                    }
                }
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Street Address", text: $streetAddress)
                    TextField("City", text: $city)
                    TextField("Zip", text: $zip)
                }
                    
                Section {
                    HStack {
                        Image(systemName: "hand.thumbsdown")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                        Slider(value: $userFeedback, in: 0.0...10.0)
                            .padding(.horizontal, 20)
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                    }
                }
                
                Section{
                    Button(action: {}) {
                        Text("Place Order")
                    }
                    Button(action: {self.showOrderSheet = false}) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
            }.navigationBarTitle("Welcome")
        }
    }
}

struct OrderForm_Previews: PreviewProvider {
    static var previews: some View {
        OrderForm(showOrderSheet: .constant(true))
    }
}
