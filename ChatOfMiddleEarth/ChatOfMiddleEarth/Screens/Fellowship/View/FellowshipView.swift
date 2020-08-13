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

class FellowshipView: UIView {

    @IBOutlet var contentView: UIView!
    
    //Properties
    weak var delegate: FellowshipViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
//    @IBAction func didTapChat(_ sender: Any) {
//        delegate?.startChat()
//    }
    
}

extension FellowshipView {

    private func commonInit() {
        Bundle.main.loadNibNamed("FellowshipView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
