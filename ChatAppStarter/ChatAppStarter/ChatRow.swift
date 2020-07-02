//
//  ChatRow.swift
//  ChatAppStarter
//
//  Created by Jeremy's Macbook Pro 16 on 6/29/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct ChatRow: View {
    
    var message: ChatMessage
    
    var body: some View {
        HStack {
            
            if message.isMe {
                Spacer()
            }
            
            
            VStack(alignment: .leading) {
                Text("\(self.message.username)")
                    .font(.footnote)
                    .foregroundColor(message.isMe ? lightGreyColor : .gray)
                Text("\(self.message.messageText)")
            }
            .padding(10)
            .background(message.isMe ? Color.blue : lightGreyColor)
            .cornerRadius(10)
            .frame(maxWidth: 280, alignment: self.message.isMe ? .trailing : .leading)
            
            if !message.isMe {
                Spacer()
            }
        }
        .padding()
        
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(message: ChatMessage(messageText: "Hello", username: "Not me"))
    }
}
