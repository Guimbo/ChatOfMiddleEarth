//
//  CardView.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 12/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

final class EnterpriseCard: UIView {

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
        fontType: UIFont.systemFont(ofSize: 18),
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

extension EnterpriseCard: CodeViewProtocol {

    // MARK: - Hierarchy
    func buildViewsInHierarchy() {
        addSubviews([logoEnterprise, nameEnterprise])
    }

    // MARK: - Constraints
    func setContrains() {
        NSLayoutConstraint.activate([

            logoEnterprise.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoEnterprise.widthAnchor.constraint(equalToConstant: InternalSizes.smallWidht.rawValue),
            logoEnterprise.heightAnchor.constraint(equalToConstant: Sizes.xheight.rawValue),
            logoEnterprise.topAnchor.constraint(
                equalTo: self.topAnchor, constant: Metrics.large.rawValue),

            nameEnterprise.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameEnterprise.topAnchor.constraint(
                equalTo: logoEnterprise.bottomAnchor, constant: Metrics.xsmall.rawValue),
            nameEnterprise.leftAnchor.constraint(equalTo: self.leftAnchor),
            nameEnterprise.rightAnchor.constraint(equalTo: self.rightAnchor),
            nameEnterprise.heightAnchor.constraint(equalToConstant: Sizes.xheight.rawValue)

        ])
    }
}
