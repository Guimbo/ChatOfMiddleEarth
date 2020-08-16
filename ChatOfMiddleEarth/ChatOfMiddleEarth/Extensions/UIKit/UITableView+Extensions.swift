//
//  UITableView+Extensions.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 12/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

extension UITableView {

    convenience init(style: UITableView.Style) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white

    }

    func setOwnerView(owner: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: owner.topAnchor),
            self.leftAnchor.constraint(equalTo: owner.leftAnchor),
            self.rightAnchor.constraint(equalTo: owner.rightAnchor),
            self.bottomAnchor.constraint(equalTo: owner.bottomAnchor)
        ])
    }
}

