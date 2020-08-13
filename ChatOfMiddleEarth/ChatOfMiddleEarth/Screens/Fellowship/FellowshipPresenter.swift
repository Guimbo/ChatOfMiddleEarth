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
    var delegate: FellowshipDelegate?
    private var username: String
    private var port: String
    var contacts:[Friend] = []
    
    required init(coordinator: FellowshipCoordinating, username: String, port: String) {
        self.coordinator = coordinator
        self.username = username
        self.port = port
    }
}

extension FellowshipPresenter: FellowshipViewPresenting {
    func setDelegate(withViewController delegate: FellowshipViewController) {
        self.delegate = delegate
    }
    
    func addFriend(withName name: String) {
        let friend = Friend(friendName: name)
        contacts.append(friend)
        delegate?.showListOfFriends(contacts)
        
    }
    
    func getAllFriendsCount() -> Int {
        return contacts.count
    }
    
    func getFriend(byIndex: Int) -> Friend {
        return contacts[byIndex]
    }
    
    func joinInChat() {
        coordinator?.showChatScreen(withUser: username, andportNumber: port)
    }
}
