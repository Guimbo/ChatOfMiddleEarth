//
//  CodeViewProtocol.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 12/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

protocol CodeViewProtocol: class {
    func buildViewsInHierarchy()

    func setContrains()

    func setupView()
}

extension CodeViewProtocol {

    func setupView() {
        buildViewsInHierarchy()
        setContrains()
    }

}

