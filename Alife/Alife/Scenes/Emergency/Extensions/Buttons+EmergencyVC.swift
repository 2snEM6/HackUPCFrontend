//
//  Buttons+EmergencyVC.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import Foundation

extension EmergencyViewController {
    func sendEmergency(type: Int) {
        getUserLocation { (lat, long) in
            self.emergencyAPIStore.postEmergency(self.userID, type: type, lat:
                lat, long: long)
        }
    }
    
    func deadRisk() {
        let type = 2
        sendEmergency(type)
    }
    
    func severe() {
        let type = 1
        sendEmergency(type)
    }
    
    func hazard() {
        let type = 0
        sendEmergency(type)
        
    }
}