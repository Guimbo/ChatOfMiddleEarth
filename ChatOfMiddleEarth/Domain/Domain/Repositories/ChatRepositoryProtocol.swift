//
//  ChatRepositoryProtocol.swift
//  Domain
//
//  Created by Guilherme Araujo on 11/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public protocol ChatRepositoryProtocol: AnyObject {
    func sendMessage(message: String, toDestiny destiny: String)
    func stopChatSession()
}
