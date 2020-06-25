//
//  ContentView.swift
//  swiftui-contact-book
//
//  Created by Jeremy's Macbook Pro 16 on 6/24/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(contacts) { contact in
                NavigationLink(destination: DetailView(contact: contact)) {
                    ContactRow(contact: contact)
                }
            }
            .navigationBarTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Image(contact.imageName)
                .resizable()
                .scaledToFill()
                //                    .aspectRatio(contentMode: .fill)
                .frame(width: 60.0, height: 60.0)
                //                    .clipShape(Circle())
                .cornerRadius(50)
            //                    .clipped()
            
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.system(size: 21, weight: .medium, design: .default))
                Text(contact.phone)
            }
            
        }
    }
}
