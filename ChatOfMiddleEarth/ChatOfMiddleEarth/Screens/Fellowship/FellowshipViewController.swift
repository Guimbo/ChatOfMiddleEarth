//
//  FellowshipViewController.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//
import UIKit

protocol FellowshipViewPresenting {
    
    func addFriend(withName name:String)
    func getAllFriendsCount() -> Int
    func getFriend(byIndex: Int) -> Friend
    func setDelegate(withViewController delegate: FellowshipViewController)
    func joinInChat(withFriend friend: String)
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

        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(addTapped))
        button.tintColor = .white
        navigationItem.rightBarButtonItem = button
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        navigationItem.leftBarButtonItem?.action = #selector(returnToLoginView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadView() {
        super.loadView()
        self.view = fellowshipView
        self.presenter?.setDelegate(withViewController: self)
        showListOfFriends([])
    }
    
    @objc func addTapped() {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Novo Aventureiro", message: "Digite o nome", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "username"
        }
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Adicionar", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.presenter?.addFriend(withName: textField?.text ?? "")
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func returnToLoginView() {
        self.navigationController?.dismiss(animated: true, completion: nil)
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
        return (presenter?.getAllFriendsCount()) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: FriendCell = tableView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath) as? FriendCell else {
                return UITableViewCell()
        }

        let friend = self.presenter?.getFriend(byIndex: indexPath.row)

        cell.friendCard.nameFriend.text = friend?.friendName

        if let color = UIColor.colorTable.randomElement() {
            cell.friendCard.backgroundColor = color
            cell.friendCard.layer.borderColor = color.cgColor
        }

        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let selectedfriend = self.presenter?.getFriend(byIndex: indexPath.row) else { return }

        //guard let cell = tableView.cellForRow(at: indexPath) as? FriendCell else { return }

        self.presenter?.joinInChat(withFriend: selectedfriend.friendName)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}
