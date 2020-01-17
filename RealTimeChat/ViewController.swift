//
//  ViewController.swift
//  RealTimeChat
//
//  Created by 宏輝 on 12/01/2020.
//  Copyright © 2020 宏輝. All rights reserved.
//

import UIKit
import MessageKit

class ViewController: MessagesViewController,MessagesDisplayDelegate,MessagesLayoutDelegate {
    
    
    let sender = Sender(id: "any_unique_id", displayName: "Steven")
    let messages: [MessageType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        
    }
    
    
}

extension ViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        <#code#>
    }
    
    // idとdisplayNameをプロパティに持つ構造体Senderを返す
    func currentSender() -> Sender {
        return Sender(id: "1", displayName: "Tom")
    }
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    func messageForItem(at indexPath: IndexPath,
                        in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    func cellTopLabelAttributedText(for message: MessageType,
                                    at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(
            string: name,
            attributes: [
                .font: UIFont.preferredFont(forTextStyle: .caption1),
                .foregroundColor: UIColor(white: 0.3, alpha: 1)
            ]
        )
    }
}
