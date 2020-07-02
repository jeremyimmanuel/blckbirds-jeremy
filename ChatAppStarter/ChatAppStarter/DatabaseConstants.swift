//
//  DatabaseConstants.swift
//  ChatAppStarter
//
//  Created by Jeremy's Macbook Pro 16 on 6/29/20.
//  Copyright © 2020 Andreas Schultz. All rights reserved.
//

import Foundation
import Firebase

let databaseRoot = Database.database().reference()

let databaseChats = databaseRoot.child("chats")
