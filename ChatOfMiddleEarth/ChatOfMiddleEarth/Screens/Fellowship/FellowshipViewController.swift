//
//  FellowshipViewController.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//
import UIKit

protocol FellowshipViewPresenting {
    
    func joinInChat(withUser user: String, andPort port: String)
}

class FellowshipViewController: UIViewController {
    
    private lazy var fellowshipView = FellowshipView()
    private let presenter: FellowshipPresenting?
    
    init(presenter: FellowshipPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func loadView() {
        super.loadView()
        fellowshipView.delegate = self
        self.view = fellowshipView
    }


}

extension FellowshipViewController: FellowshipViewDelegate {
    func startChat(withUser user: String, andPort port: String) {
        <#code#>
    }

}
