//
//  ChatMessage.swift
//  ChatAppStarter
//
//  Created by Jeremy's Macbook Pro 16 on 6/28/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import Foundation

class ChatMessage {
    let messageText: String
    let username: String
    let isMe: Bool
    let messageId = UUID()
    
    init(messageText: String, username: String) {
        self.messageText = messageText
        self.username = username
        if UserDefaults.standard.string(forKey: "username") == username {
            self.isMe = true
        } else {
            self.isMe = false
        }
        
    }
}

let sampleConversation = [
    ChatMessage(messageText: "Hello how are you?", username: "Me"),//, isMe: true),
    ChatMessage(messageText: "I'm fine and you?", username: "Another user"),//, isMe: false),
    ChatMessage(messageText: "I'm fine as well. Thanks for asking. What are you doing right now?", username: "Me")//, isMe: true)
]
