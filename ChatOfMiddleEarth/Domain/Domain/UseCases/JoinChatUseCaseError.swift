//
//  JoinChatUseCaseError.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public enum JoinChatUseCaseError: Error {
    
    public enum UserName: Error {
        case empty
    }
    public enum PortNumber: Error {
        case empty
        case invalid
    }
    
    case username(UserName)
    case portnumber(PortNumber)
    
}
