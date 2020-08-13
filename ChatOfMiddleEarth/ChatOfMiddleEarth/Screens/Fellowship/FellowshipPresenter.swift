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

protocol FellowshipDelegate: class {
    func showListOfFriends(_ listOfFriends: [Friend])
}

class FellowshipPresenter {
    private var coordinator: FellowshipCoordinating?
    private var username: String
    private var port: String
    
    required init(coordinator: FellowshipCoordinating, username: String, port: String) {
        self.coordinator = coordinator
        self.username = username
        self.port = port
    }
}

extension FellowshipPresenter: FellowshipViewPresenting {
    func joinInChat() {
        coordinator?.showChatScreen(withUser: username, andportNumber: port)
    }
}
