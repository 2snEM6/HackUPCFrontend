//
//  Emergency.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import SwiftyJSON


public protocol EmergencySerializable {
    static func object(fromJSON json: JSON) -> AnyObject?
}


class Emergency: EmergencySerializable {
    let id:String
    let type:Int
    let location: Location
    let timestamp: Int
    
    init(id: String, type: Int, location: Location, timestamp: Int) {
        
        self.id = id
        self.type = type
        self.location = location
        self.timestamp = timestamp
    }
    
    static func object(fromJSON json: JSON) -> AnyObject? {
        
        if let location = Location.object(fromJSON: json["data"]["location"]) as? Location {
            guard let id = json["key"].string
                , let type = json["data"]["type"].int
                , let type = json["data"]["_timestamp"].int
                else {
                    print("ERROR: Parsing emergency")
                    return nil
            }
            
            return Emergency(id: id, type: type, location: location, timestamp: timestamp)
        }
        return nil
    }
}
