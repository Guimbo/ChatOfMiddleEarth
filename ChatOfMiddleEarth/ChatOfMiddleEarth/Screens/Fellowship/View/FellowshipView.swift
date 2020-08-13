//
//  FellowshipView.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

protocol FellowshipViewDelegate: AnyObject {
    func startChat()
}

import UIKit

final class FellowshipView: UIView {

    // MARK: - Enum With internal Sizes
    fileprivate enum InternalSizes: CGFloat {
        case background = 92.0
        case fontSize = 18.0
    }

    // MARK: - Components

    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()

    // MARK: - Setup Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension FellowshipView: CodeViewProtocol {

    // MARK: - Hierarchy
    func buildViewsInHierarchy() {
        addSubviews([contentView])

    }

    // MARK: - Constraints
    func setContrains() {
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }

}
