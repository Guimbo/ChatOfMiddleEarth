//
//  CustomNavigation.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 13/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//


import UIKit

class CustomNavigation: UINavigationController {

    private let barButtonAppearence = UIBarButtonItem.appearance()

    private lazy var viewTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupNavigation(withTitle title: String, andHiddenBar isHidden: Bool, andAnimation animation: Bool) {
        self.setNavigationBarHidden(isHidden, animated: animation)
        viewTitle.text = title
    }

    func setup() {
        self.setNavigationBarHidden(true, animated: false)
        self.navigationBar.barTintColor = UIColor.colorTable[5]
        self.navigationBar.shadowImage = UIImage()

        let backButton = UIImage(named: "backArrow")
        let attribute = [NSAttributedString.Key.foregroundColor: UIColor.clear]

        barButtonAppearence.setTitleTextAttributes(attribute, for: .normal)
        barButtonAppearence.setTitleTextAttributes(attribute, for: .highlighted)

        self.navigationBar.backIndicatorImage = backButton
        self.navigationBar.backIndicatorTransitionMaskImage = backButton
        self.navigationBar.tintColor = UIColor.white
        self.view.tintColor = UIColor.white

        self.navigationBar.addSubview(viewTitle)

        NSLayoutConstraint.activate([
            viewTitle.centerYAnchor.constraint(equalTo: self.navigationBar.centerYAnchor),
            viewTitle.centerXAnchor.constraint(equalTo: self.navigationBar.centerXAnchor)
        ])
    }

    func setupNavigationBackButton() {
        let backButton = UIImage(named: "backArrow")
        self.navigationBar.backIndicatorImage = backButton
        self.navigationBar.backIndicatorTransitionMaskImage = backButton
    }
}
