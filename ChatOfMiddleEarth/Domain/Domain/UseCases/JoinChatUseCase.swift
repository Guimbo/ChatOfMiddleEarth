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

public protocol JoinChatUseCaseProtocol {
    func execute(withUser username: String,
                 andPortNumber portnumber: String,
                 andCompletion completion: (Result<Void, JoinChatUseCaseError>))
}
