//
//  JoinChatRepositoryProtocol.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public protocol JoinChatRepositoryProtocol: AnyObject {
    func registerUserInServer(usingUserName username: String,
                              andPortNumber portNumber: UInt32,
                              toFriend friend: String,
                              andCompletion completion: (Result<Void, Error>) -> Void)
}
