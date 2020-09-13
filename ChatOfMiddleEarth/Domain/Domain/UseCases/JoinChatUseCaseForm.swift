//
//  JoinChatUseCase.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public protocol JoinChatUseCaseFormProtocol {
    func execute(username: String,
                 xPos: String,
                 yPos: String,
                 andCompletion completion: (Result<Void, JoinChatUseCaseFormError>) -> Void)
}

public class JoinChatUseCaseForm {

    public init() {}
}

extension JoinChatUseCaseForm: JoinChatUseCaseFormProtocol {

    public func execute(username: String,
                        xPos: String,
                        yPos: String,
                        andCompletion completion: (Result<Void, JoinChatUseCaseFormError>) -> Void) {
        
        let portnumber = "123"
        guard UInt32(portnumber) != nil else {
            completion(.failure(.portnumber(.invalid)))
            return
        }

        if username.isEmpty {
            completion(.failure(.username(.empty)))
        } else if portnumber.isEmpty {
            completion(.failure(.portnumber(.empty)))
        } else {
            completion(.success(()))
        }
    }
    
    
}
