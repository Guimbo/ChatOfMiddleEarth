//
//  LoginView.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func doLogin(user: String, xPos: String, yPos: String)
}

class LoginView: UIView {


    //Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var nametextField: UITextField! {
           didSet {
               nametextField.returnKeyType = .done
               nametextField.autocorrectionType = .no
           }
       }
    @IBOutlet weak var XtextField: UITextField! {
              didSet {
                  XtextField.returnKeyType = .done
                  XtextField.autocorrectionType = .no
              }
          }
    @IBOutlet weak var YtextField: UITextField! {
              didSet {
                  YtextField.returnKeyType = .done
                  YtextField.autocorrectionType = .no
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
        delegate?.doLogin(user: nametextField.text ?? "",
                          xPos: XtextField.text ?? "",
                          yPos: YtextField.text ?? "")
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
