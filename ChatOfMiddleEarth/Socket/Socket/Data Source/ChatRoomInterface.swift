//
//  ChatRoomProtocol.swift
//  Socket
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation 

public protocol ChatRoomInterface {

    func setupNetworkCommunication()
    func joinInSpace()
    func validateUsername(username:String) -> Bool
    func joinUsingLocation(username: String, xPos: String, yPos: String)
    func send(message: String, toFriend friend: String)
    func stopChatSession()

}
