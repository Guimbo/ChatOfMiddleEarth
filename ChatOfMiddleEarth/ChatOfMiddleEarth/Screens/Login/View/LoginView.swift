//
//  LoginView.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func doLogin(withUser user: String, andPort port: String)
}

class LoginView: UIView {
    
    
    //Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var userNameTextField: UITextField! {
        didSet {
            userNameTextField.keyboardType = .default
            userNameTextField.returnKeyType = .done
            userNameTextField.autocorrectionType = .no
        }
    }
    @IBOutlet weak var portNumberTextField: UITextField!{
        didSet {
            portNumberTextField.keyboardType = .numberPad
            portNumberTextField.returnKeyType = .done
            portNumberTextField.autocorrectionType = .no
        }
    }
    
    
    
    //Properties
    weak var delegate: LoginViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    @IBAction func doLogin(_ sender: Any) {
        delegate?.doLogin(withUser: userNameTextField.text ?? "",
                          andPort: portNumberTextField.text ?? "")
    }
    
}

extension LoginView {

    private func commonInit() {
        Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
