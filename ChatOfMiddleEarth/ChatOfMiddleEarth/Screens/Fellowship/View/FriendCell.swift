//
//  FriendCell.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 12/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

final class FriendCell: UITableViewCell {

    // MARK: - Enum with Internal Size
    fileprivate enum InternalSizes: CGFloat {

        case bigHeight = 120.0
    }

    // MARK: - Components

    lazy var friendCard: CardView = {
        let card = CardView(bgColor: .white)
        card.layer.borderWidth = 1.0
        card.layer.cornerRadius = 8.0
        card.layer.borderColor = UIColor.white.cgColor
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()

    // MARK: - Init Functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FriendCell : CodeViewProtocol {

    // MARK: - Hierarchy
    func buildViewsInHierarchy() {
        addSubview(friendCard)
    }

    // MARK: - Constraints
    func setContrains() {
        NSLayoutConstraint.activate([
            friendCard.topAnchor.constraint(equalTo: self.topAnchor),
            friendCard.heightAnchor.constraint(equalToConstant: InternalSizes.bigHeight.rawValue),
            friendCard.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                 constant: 16.0),
            friendCard.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                  constant: -16.0)
        ])
    }
}

