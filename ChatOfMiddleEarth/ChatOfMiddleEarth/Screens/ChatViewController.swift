//
//  ChatViewController.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit
import SnapKit
import Domain

protocol ChatViewPresenting {
    
    func attachDelegate(_ delegate: ChatViewControllerDelegate)
    func getFriend() -> String
    func sendMessage(message: String)
    func addMessage(message:Message)
    func getMessagesCount() -> Int
    func getMessage(ByIndex index: Int) -> Message
    func finishChat()
}

protocol ChatViewControllerDelegate: class {
    func insertNewMessageCell(_ message: Message)
    func checkGiveUp(message: Message)
}

class ChatViewController: UIViewController {

    let chatView = ChatView()
    let presenter: ChatViewPresenting
    
    init(presenter: ChatViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.attachDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        self.view.addSubview(chatView)
        self.configChatView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.finishChat()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatView.tableView.dataSource = self
        chatView.tableView.delegate = self
        chatView.messageInputBar.delegate = self
        navigationItem.leftBarButtonItem?.action = #selector(disconnect)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @objc func disconnect() {
        presenter.finishChat()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func configChatView(){
        self.chatView.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.left.bottom.top.equalToSuperview()
        }
    }
    
}

//MARK - Message Input Bar
extension ChatViewController: MessageInputDelegate {
  func sendWasTapped(message: String) {
    presenter.sendMessage(message: message)
    print("Enviando")
    print(message)
  }
}

extension ChatViewController: ChatViewControllerDelegate {

    func checkGiveUp(message: Message) {
        if message.message == "DESISTO" {
    
            self.alert_one_option(titleAlert: "The Last Goodbye", messageAlert: "O adeus vamos dar antes da aurora", buttonDismiss: "Bye!")
            
        }
    }

    func insertNewMessageCell(_ message: Message) {
      presenter.addMessage(message: message)
      let count = presenter.getMessagesCount()
      let indexPath = IndexPath(row: count - 1, section: 0)
      chatView.tableView.beginUpdates()
      chatView.tableView.insertRows(at: [indexPath], with: .bottom)
      chatView.tableView.endUpdates()
      chatView.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

}

extension ChatViewController {

  @objc func keyboardWillChange(notification: NSNotification) {
    if let userInfo = notification.userInfo {
      let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)!.cgRectValue
        let messageBarHeight = chatView.messageInputBar.bounds.size.height
      let point = CGPoint(x: chatView.messageInputBar.center.x, y: endFrame.origin.y - messageBarHeight/2.0)
      let inset = UIEdgeInsets(top: 0, left: 0, bottom: endFrame.size.height, right: 0)
      UIView.animate(withDuration: 0.25) {
        self.chatView.messageInputBar.center = point
        self.chatView.tableView.contentInset = inset
      }
    }
  }

  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let messageBarHeight:CGFloat = 60.0
    let size = chatView.bounds.size
    chatView.tableView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height - messageBarHeight - chatView.safeAreaInsets.bottom)
    chatView.messageInputBar.frame = CGRect(x: 0, y: size.height - messageBarHeight - self.view.safeAreaInsets.bottom, width: size.width, height: messageBarHeight)
  }
    
    func alert_one_option(titleAlert: String, messageAlert: String, buttonDismiss: String){
        let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: buttonDismiss, style: .cancel) {
               UIAlertAction in
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = MessageTableViewCell(style: .default, reuseIdentifier: "MessageCell")
    cell.selectionStyle = .none
    
    let message = presenter.getMessage(ByIndex: indexPath.row)
    cell.apply(message: message)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.getMessagesCount()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let height = MessageTableViewCell.height(for: presenter.getMessage(ByIndex: indexPath.row),
                                             maxSizeOfView: Float(self.view.bounds.width))
    return height
  }
}


