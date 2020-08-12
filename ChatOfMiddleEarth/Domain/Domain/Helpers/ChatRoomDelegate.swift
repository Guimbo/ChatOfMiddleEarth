//
//  ChatRoomDelegate.swift
//  Domain
//
//  Created by Guilherme Araujo on 11/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public protocol ChatRoomDelegate: class {
    func received(message: Message)
}
