//
//  FellowshipViewController.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//
import UIKit

protocol FellowshipViewPresenting {
    
    func joinInChat()
}

class FellowshipViewController: UIViewController {
    
    private lazy var fellowshipView = FellowshipView()
    private let presenter: FellowshipViewPresenting?
    let contacts = UITableView(style: .grouped)
    
    init(presenter: FellowshipViewPresenting) {
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
        self.view = fellowshipView
        showListOfFriends([])
    }


}

// MARK: - Presenter Functions
extension FellowshipViewController: FellowshipDelegate {

    func showListOfFriends(_ listOfFriends: [Friend]) {
        self.fellowshipView.contentView.cleanView()
        self.contacts.reloadData()
        self.configTableView()
        self.fellowshipView.contentView.addSubview(contacts)
        self.contacts.setOwnerView(owner: self.fellowshipView.contentView)
    }

}

// MARK: - Setup Functions
extension FellowshipViewController {
    private func configTableView() {
        contacts.dataSource = self
        contacts.delegate = self
        contacts.register(FriendCell.self, forCellReuseIdentifier: "cell")
        contacts.separatorStyle = .none
        contacts.backgroundColor = .white
    }
}

// MARK: - TableView Delegate & DataSource
extension FellowshipViewController:  UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return (self.presenter?.getCountFriends())!
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: FriendCell = tableView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath) as? FriendCell else {
                return UITableViewCell()
        }

        //let friend = self.presenter?.getFriend(byIndex: indexPath.row)

        cell.friendCard.nameFriend.text = "Aragorn"

        if let color = UIColor.colorTable.randomElement() {
            cell.friendCard.backgroundColor = color
            cell.friendCard.layer.borderColor = color.cgColor
        }

        cell.selectionStyle = .none
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedEnterprise = (self.presenter?.getEnterprise(byIndex: indexPath.row))!
//        guard let cell = tableView.cellForRow(at: indexPath) as? EnterpriseCell else {
//            return
//        }
//
//        guard let selectedColor = cell.cardEnterprise.backgroundColor else { return }
//        guard let indexColor: Int = UIColor.colorTable.firstIndex(of: selectedColor) else { return }
//
//        self.delegate?.showDetails(withEnterprise: selectedEnterprise,
//                                   andIndex: indexColor)
//    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}


//extension FellowshipViewController: FellowshipViewDelegate {
//    func startChat() {
//        presenter?.joinInChat()
//    }
//
//}
