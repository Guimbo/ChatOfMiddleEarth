//
//  LoginUseCase.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public protocol LoginUseCaseProtocol {
    func execute(withUser username: String,
                 andPortNumber portnumber: String,
                 andCompletion completion: (Result<Void, Error>) -> Void)
}


public class LoginUseCase {
    private let joinChatRepository: JoinChatRepositoryProtocol
    
    public init(joinChatRepository: JoinChatRepositoryProtocol) {
        self.joinChatRepository = joinChatRepository
    }
}

extension LoginUseCase: LoginUseCaseProtocol {
    public func execute(withUser username: String, andPortNumber portnumber: String, andCompletion completion: (Result<Void, Error>) -> Void) {
        
        guard let portNumberUInt32 = UInt32(portnumber) else { return }
        joinChatRepository.registerUserInServer(usingUserName: username,
                                                andPortNumber: portNumberUInt32,
                                                andCompletion: completion)
    }
}
