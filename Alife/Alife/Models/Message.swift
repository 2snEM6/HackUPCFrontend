//
//  Message.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import SwiftyJSON

public protocol MessageSerializable {
    static func object(fromJSON json: JSON) -> AnyObject?
}

class Message: MessageSerializable {
    let id: String
    var type: String
    var content: String
    var sentDate: String
    var senderID: String
    var senderName: String
    
    
    init(id: String, type: String, content: String, sentDate: String, senderID: String, senderName: String) {
        self.id = id
        self.type = type
        self.content = content
        self.sentDate = sentDate
        self.senderID = senderID
        self.senderName = senderName
    }
    
    static func object(fromJSON json: JSON) -> AnyObject? {
        guard let id = json["data"]["id"].string
            , let type = json["data"]["type"].string
            , let content = json["data"]["content"].string
            , let sentDate = json["data"]["sentDate"].string
            , let senderID = json["data"]["senderID"].string
            , let senderName = json["data"]["senderName"].string
            else {
                print("ERROR: Parsing Message")
                return nil
        }
        
        return Message(id: id, type: type, content: content, sentDate: sentDate, senderID: senderID, senderName: senderName)
        
    }
}
