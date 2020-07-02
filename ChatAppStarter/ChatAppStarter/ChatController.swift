//
//  CHatController.swift
//  ChatAppStarter
//
//  Created by Jeremy's Macbook Pro 16 on 6/29/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ChatController: ObservableObject {
    var messages = [ChatMessage]()
    
    let objectWillChange = PassthroughSubject<ChatController, Never>()
    
    func sendMessage(messageText: String) {
        let newChat = databaseChats.childByAutoId()
        
        let messageToSend = [
            "username": UserDefaults.standard.string(forKey: "username") ?? "Unknown user",
            "messageText" : messageText
        ]
        
        newChat.setValue(messageToSend)
        
    }
    
    func receiveMessages() {
        let query = databaseChats.queryLimited(toLast: 100)
        _ = query.observe(.childAdded, with: { [weak self] snapshot in
            
            if let data = snapshot.value as? [String: String], let retrievedUsername = data["username"], let retrievedMessageText = data["messageText"], !retrievedMessageText.isEmpty {
                let retrievedMessage = ChatMessage(messageText: retrievedMessageText, username: retrievedUsername)
                self?.messages.append(retrievedMessage)
                self?.objectWillChange.send(self!)
            }
            
        })
    }
}
