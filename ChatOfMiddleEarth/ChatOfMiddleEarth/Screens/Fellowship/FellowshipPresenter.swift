//
//  FellowshipPresenter.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

protocol FellowshipCoordinating {
    func showChatScreen(withUser username: String, andportNumber portnumber: String)
}

class FellowshipPresenter {
    private var coordinator: FellowshipCoordinating?
    
    required init(coordinator: FellowshipCoordinating) {
        self.coordinator = coordinator
    }
}

extension FellowshipPresenter: FellowshipViewPresenting {
    func joinInChat(withUser user: String, andPort port: String) {
        self.coordinator?.showChatScreen(withUser: user, andportNumber: port)
    }
}
