//
//  MessageTableViewCell.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 10/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit
import Domain

class MessageTableViewCell: UITableViewCell {
  var messageSender: MessageSender = .ourself
  let messageLabel = DrawedLabel()
  let nameLabel = DrawedLabel()
  
  func apply(message: Message) {
    nameLabel.text = message.senderUsername
    messageLabel.text = message.message
    messageSender = message.messageSender
    setNeedsLayout()
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    messageLabel.clipsToBounds = true
    messageLabel.textColor = .white
    messageLabel.numberOfLines = 0
    
    nameLabel.textColor = .lightGray
    nameLabel.font = UIFont(name: "Helvetica", size: 10)

    clipsToBounds = true
    
    addSubview(messageLabel)
    addSubview(nameLabel)
  }
  
    class func height(for message: Message, maxSizeOfView: Float) -> CGFloat {
        let maxSize = CGSize(width: CGFloat(maxSizeOfView), height: CGFloat.greatestFiniteMagnitude)
    let nameHeight = message.messageSender == .ourself ? 0 : (height(forText: message.senderUsername, fontSize: 10, maxSize: maxSize) + 4 )
    let messageHeight = height(forText: message.message, fontSize: 17, maxSize: maxSize)
    
    return nameHeight + messageHeight + 32 + 16
  }
  
  private class func height(forText text: String, fontSize: CGFloat, maxSize: CGSize) -> CGFloat {
    let font = UIFont(name: "Helvetica", size: fontSize)!
    let attrString = NSAttributedString(string: text, attributes:[NSAttributedString.Key.font: font,
                                                                  NSAttributedString.Key.foregroundColor: UIColor.white])
    let textHeight = attrString.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil).size.height

    return textHeight
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
