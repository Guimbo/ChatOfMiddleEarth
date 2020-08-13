//
//  FriendCell.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 12/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

final class EnterpriseCell: UITableViewCell {

    // MARK: - Enum with Internal Size
    fileprivate enum InternalSizes: CGFloat {

        case bigHeight = 120.0
    }

    // MARK: - Components


    // MARK: - Init Functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EnterpriseCell : CodeViewProtocol {

    // MARK: - Hierarchy
    func buildViewsInHierarchy() {
        addSubview(cardEnterprise)
    }

    // MARK: - Constraints
    func setContrains() {
        NSLayoutConstraint.activate([
            cardEnterprise.topAnchor.constraint(equalTo: self.topAnchor),
            cardEnterprise.heightAnchor.constraint(equalToConstant: InternalSizes.bigHeight.rawValue),
            cardEnterprise.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                 constant: Metrics.small.rawValue),
            cardEnterprise.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                  constant: -Metrics.small.rawValue)
        ])
    }
}

