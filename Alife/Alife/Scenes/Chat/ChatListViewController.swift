//
//  ChatViewController.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase


class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let emergencyAPIStore = EmergencyAPIStore()
    
    var userID:String = ""
    
    var emergenciesID: [String] = []
    var emergencies: [String : Emergency] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userID = (FIRAuth.auth()?.currentUser?.uid)!
        
        
        print("TEST: GET ALL emergencies")
        emergencyAPIStore.getUserEmergenciesID(userID) { (emergencyID) in
            self.emergenciesID.append(emergencyID)
            self.emergencyAPIStore.getEmergency(emergencyID, callback: { (emergency) in
                self.emergencies[emergency.id] = emergency
            })
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    
}
