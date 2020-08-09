//
//  Message.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public struct Message {
  let message: String
  let senderUsername: String
  let messageSender: MessageSender
    
  public init(message: String, messageSender: MessageSender, username: String) {
    self.message = message.withoutWhitespace()
    self.messageSender = messageSender
    self.senderUsername = username
  }
}
