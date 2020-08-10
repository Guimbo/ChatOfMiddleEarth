//
//  FellowshipView.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

protocol FellowshipViewDelegate: AnyObject {
    func startChat(withUser user: String, andPort port: String)
}

class FellowshipView: UIView {

    @IBOutlet var contentView: UIView!
    
    //Properties
    weak var delegate: FellowshipViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

}

extension FellowshipView {

    private func commonInit() {
        Bundle.main.loadNibNamed("FellowshipView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
