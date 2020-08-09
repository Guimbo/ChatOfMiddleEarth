//
//  JoinChatUseCase.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

// Instanciar um chat Shared
// passar para a proxima view o nome e para o chatRoom o port number em UInt32
// tentará dá um join chat, se não conseguir mostra warning
// se conseguir abre next tela

public protocol JoinChatUseCaseFormProtocol {
    func execute(withUser username: String,
                 andPortNumber portnumber: String,
                 andCompletion completion: (Result<Void, JoinChatUseCaseFormError>) -> Void)
}

public class JoinChatUseCaseForm {

    public init() {}
}

extension JoinChatUseCaseForm: JoinChatUseCaseFormProtocol {
    public func execute(withUser username: String,
                        andPortNumber portnumber: String,
                        andCompletion completion: (Result<Void, JoinChatUseCaseFormError>) -> Void) {
        
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
