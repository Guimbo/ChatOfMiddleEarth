//
//  ChatRoomImplementation.swift
//  Socket
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import Domain

protocol ChatRoomDelegate {
    func received(message: Message)
}
