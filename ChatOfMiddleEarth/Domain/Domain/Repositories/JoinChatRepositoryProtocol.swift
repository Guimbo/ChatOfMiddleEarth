//
//  JoinChatRepositoryProtocol.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public protocol JoinChatRepositoryProtocol: AnyObject {
    func registerUserInServer(username: String, xPos: String, yPos: String,
                              andCompletion completion: (Result<Void, LoginUseCaseError>) -> Void)
}
