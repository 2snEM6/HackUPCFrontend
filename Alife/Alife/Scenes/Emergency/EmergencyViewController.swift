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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //  testing
        getUserLocation()
        
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
