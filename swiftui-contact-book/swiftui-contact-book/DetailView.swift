//
//  DetailView.swift
//  swiftui-contact-book
//
//  Created by Jeremy's Macbook Pro 16 on 6/24/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let contact: Contact
    var body: some View {
        VStack {
            VStack {
                Image(contact.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(radius: 10)
                .frame(width: 250.0, height: 250.0)
                
                Text(contact.name)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    
            }
            
            Form {
                Section {
                    HStack {
                        Text("Phone")
                        Spacer()
                        Text(contact.phone)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(contact.email)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Address")
                        Spacer()
                        Text(contact.address)
                            .foregroundColor(.gray)
                            .font(.callout)
                            .frame(width: 180)
                    }
                }
                
                Section {
                    Button (action: {print("Send Message")}) {
                        Text("Send message")
                    }
                    Button(action: {print("call")}) {
                        Text("Call")
                    }
                }
            }
//            .frame(width: 400.0, height: 300.0)
//            .cornerRadius(50)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: contacts[0])
    }
}
