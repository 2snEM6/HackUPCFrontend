//
//  Emergency.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

class Emergency {
    var id:String
    var type:String
    var location: Location
    
    init(id: String, type: String, location: Location) {
        
        self.id = id
        self.type = type
        self.location = location
    }
}
