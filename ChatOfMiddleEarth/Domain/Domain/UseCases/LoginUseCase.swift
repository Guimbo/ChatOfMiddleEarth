//
//  LoginUseCase.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public protocol LoginUseCaseProtocol {
     func execute(username: String,
                    xPos: String,
                    yPos: String,
                    andCompletion completion: (Result<Void, LoginUseCaseError>) -> Void)
}


public class LoginUseCase {
    private let joinChatRepository: JoinChatRepositoryProtocol
    
    public init(joinChatRepository: JoinChatRepositoryProtocol) {
        self.joinChatRepository = joinChatRepository
    }
}

extension LoginUseCase: LoginUseCaseProtocol {
    public func execute(username: String, xPos: String, yPos: String,
                        andCompletion completion: (Result<Void, LoginUseCaseError>) -> Void) {
        
        joinChatRepository.registerUserInServer(username: username, xPos: xPos, yPos: yPos, andCompletion: completion)
    }
}
