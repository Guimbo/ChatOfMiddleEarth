//
//  Message.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public struct Message {
    public let message: String
    public let senderUsername: String
    public let destiny: String
    public let messageSender: MessageSender
    
    public init(message: String, messageSender: MessageSender, username: String, destiny: String) {
        self.message = message.withoutWhitespace()
        self.messageSender = messageSender
        self.senderUsername = username
        self.destiny = destiny
    }
}
