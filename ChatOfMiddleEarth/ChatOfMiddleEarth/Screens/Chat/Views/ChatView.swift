//
//  ChatView.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

final class ChatView: UIView {
    
    var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        return view
    }()
    
    let tableView = UITableView()
    let messageInputBar = MessageInputView()
    
    //MARK: Init Configurations

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ChatView {
    
    func setupView(){
        configView()
        buildViewsInHierarchy()
    }
    
    func configView(){
        self.backgroundColor = UIColor(red: 24 / 255, green: 180 / 255, blue: 128 / 255, alpha: 1.0)
        self.tableView.separatorStyle = .none
    }
    
    func buildViewsInHierarchy() {
        self.addSubview(tableView)
        self.addSubview(messageInputBar)
    }
    
}
    
