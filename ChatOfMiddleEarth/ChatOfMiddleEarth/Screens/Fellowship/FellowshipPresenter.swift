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
    private var coordinator: LoginCoordinating?
    
    required init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
}


