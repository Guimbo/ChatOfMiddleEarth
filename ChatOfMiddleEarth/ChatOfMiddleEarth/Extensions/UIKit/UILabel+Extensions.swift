//
//  UILabel+Extensions.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 12/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

extension UILabel {

    convenience init(text: String,
                     textColor: UIColor,
                     numberOfLines: Int?,
                     lineBreakMode: NSLineBreakMode?,
                     fontType: UIFont,
                     alignment: NSTextAlignment) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.font = fontType
        self.textAlignment = alignment

        if let lines = numberOfLines {
            self.numberOfLines = lines
        }

        if let lineBreak = lineBreakMode {
            self.lineBreakMode = lineBreak
        }
    }

    func configureToShowInWhiteView(ownerView: UIView) {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 24),
            self.widthAnchor.constraint(equalToConstant: 249),
            self.centerXAnchor.constraint(equalTo: ownerView.centerXAnchor),
            self.topAnchor.constraint(equalTo: ownerView.topAnchor, constant: 166)
        ])
    }

}
