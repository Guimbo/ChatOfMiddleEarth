//
//  FellowshipPresenter.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import Domain

protocol FellowshipCoordinating {
    func showChatScreen(withUser username: String, andportNumber portnumber: String)
}

protocol FellowshipDelegate: class {
    func showListOfFriends(_ listOfFriends: [Friend])
}

class FellowshipPresenter {
    private var coordinator: FellowshipCoordinating?
    private var loginUseCase: LoginUseCase?
    var delegate: FellowshipDelegate?
    private var username: String
    private var port: String
    var contacts:[Friend] = []
    
    required init(coordinator: FellowshipCoordinating,
                  loginUseCase: LoginUseCase,
        username: String, port: String) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
        self.username = username
        self.port = port
    }
}

extension FellowshipPresenter: FellowshipViewPresenting {

    func joinInChat(withFriend friend: String) {
        self.loginUseCase?.execute(withUser: self.username,
                                   andPortNumber: self.port,
                                   toFriend: friend) { [weak self] loginResult in
            guard let self = self else { return }
            switch loginResult{
            case .success:
                print(self.username,friend , port)
                self.coordinator?.showChatScreen(withUser: username, andportNumber: port)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
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
    
}
