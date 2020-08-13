//
//  CardView.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 12/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

final class CardView: UIView {

    // MARK: - Enum with Internal Sizes
    fileprivate enum InternalSizes: CGFloat {
        case smallWidht = 52.0
        case mediumWidht = 108.0
    }

    // MARK: - Components


    lazy var nameFriend: UILabel = UILabel (
        text: "Frodo",
        textColor: UIColor.white,
        numberOfLines: 1,
        lineBreakMode: nil,
        fontType: UIFont.boldSystemFont(ofSize: 18),
        alignment: .center)
    
    lazy var friendMessages: UILabel = UILabel (
        text: "3 Mensagens",
        textColor: UIColor.white,
        numberOfLines: 1,
        lineBreakMode: nil,
        fontType: UIFont.systemFont(ofSize: 15),
        alignment: .center)

    // MARK: - Init Functions
    init(frame: CGRect = .zero, bgColor: UIColor) {
        super.init(frame: frame)
        super.backgroundColor = bgColor
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardView: CodeViewProtocol {

    // MARK: - Hierarchy
    func buildViewsInHierarchy() {
        addSubviews([nameFriend, friendMessages])
    }

    // MARK: - Constraints
    func setContrains() {
        NSLayoutConstraint.activate([

            nameFriend.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           // nameFriend.widthAnchor.constraint(equalToConstant: InternalSizes.smallWidht.rawValue),
            nameFriend.heightAnchor.constraint(equalToConstant: 24.0),
            nameFriend.topAnchor.constraint(
                equalTo: self.topAnchor, constant: 32.0),

            friendMessages.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            friendMessages.topAnchor.constraint(
                equalTo: nameFriend.bottomAnchor, constant: 4.0),
            friendMessages.leftAnchor.constraint(equalTo: self.leftAnchor),
            friendMessages.rightAnchor.constraint(equalTo: self.rightAnchor),
            friendMessages.heightAnchor.constraint(equalToConstant: 24.0)

        ])
    }
}
