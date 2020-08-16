//
//  UIView+Extensions.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 12/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//
import UIKit

extension UIView {

    func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }

    func cleanView() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}
