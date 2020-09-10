//
//  Extensions+Alert.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 09/09/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

extension UIAlertController {

    static public func attentionAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
}
