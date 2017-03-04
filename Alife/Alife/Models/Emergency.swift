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
    
    init(id: String, type: Int, location: Location) {
        
        self.id = id
        self.type = type
        self.location = location
    }
    
    static func object(fromJSON json: JSON) -> AnyObject? {
        
        let location = Location.object(fromJSON: json["data"]["location"]) as! Location
        
        guard let id = json["key"].string
            , let type = json["data"]["type"].int
            else {
                print("ERROR: Parsing emergency")
                return nil
        }
        
        return Emergency(id: id, type: type, location: location)
    }
}
