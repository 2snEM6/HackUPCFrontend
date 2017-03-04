//
//  EmergencyViewController.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import SwiftLocation

class EmergencyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let emergencyAPIStore = EmergencyAPIStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("TEST: POSTING emergency")
        emergencyAPIStore.postEmergency("t2hLBi4OcIbededu7Q9vPQyxko33", type: 0, lat:
            41.387015, long: 2.170047)
        
        print("TEST: GET ALL emergencies")
        emergencyAPIStore.getUserEmergenciesID("t2hLBi4OcIbededu7Q9vPQyxko33") { (emergenciesID) in
            for emergencyID in emergenciesID {
                print("EmergencyID: \(emergencyID)")
            }
            self.emergencyAPIStore.getEmergencies(emergenciesID, callback: { (emergency) in
                print("Emergency: \(emergency.id)")
                print(emergency)
            })
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func getUserLocation() {
        SwiftLocation.Location.getLocation(withAccuracy: .Block, frequency: .OneShot, timeout: 50, onSuccess: { (location) in
            //double
            print("EmergencyLocation:   lat = \(location.coordinate.latitude)   long = \(location.coordinate.longitude)")
        }) { (lastValidLocation, error) in
            //double
            print("FAIL: EmergencyLocation")
        }
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }

}
