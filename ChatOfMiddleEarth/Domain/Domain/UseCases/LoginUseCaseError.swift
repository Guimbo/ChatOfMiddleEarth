//
//  LoginUseCaseError.swift
//  Domain
//
//  Created by Guilherme Araujo on 11/09/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public enum LoginUseCaseError: Error {
    
    public enum UserName: Error {
        case invalid
    }
    
    case username(UserName)
    
}
