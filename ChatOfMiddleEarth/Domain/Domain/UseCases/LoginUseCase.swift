//
//  LoginUseCase.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation


public class LoginUseCase {
    private let joinChatRepository: JoinChatRepositoryProtocol
    
    public init(joinChatRepository: JoinChatRepositoryProtocol) {
        self.joinChatRepository = joinChatRepository
    }
}
