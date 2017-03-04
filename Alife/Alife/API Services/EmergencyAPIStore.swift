//
//  EmergencyAPIStore.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import Alamofire
import Firebase
import SwiftyJSON

class EmergencyAPIStore {
    
    //  End point: /users/:id/emergencies
    func postEmergency(userID: String, type: Int, lat: Double, long: Double) {
        let URL = NSURL(string: "\(Constants.Server.URI_API)/users/\(userID)/emergencies")!
        let URLRequest = NSMutableURLRequest(URL: URL)
        
        URLRequest.HTTPMethod = "POST"
        
        URLRequest.setValue("key=\(Constants.Firebase.API_KEY)", forHTTPHeaderField: "Authorization")
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        let parameters: [String: AnyObject] = [
            "lat": lat,
            "long": long
        ]
        
        let encoded = encoding.encode(URLRequest, parameters: parameters).0
        Alamofire.request(encoded)
    }
    
    func getUserEmergenciesID(userID: String, callback: ([String]) -> Void) {
        
        FIRDatabase.database().reference().child("/userEmergencies/\(userID)").observeEventType(.Value, withBlock:  { (snapshot) in
            if let emergencyListDictionary = snapshot.value as? Dictionary<String,AnyObject> {
                var emergenciesID: [String] = []
                for (key, _) in emergencyListDictionary {
                    emergenciesID.append(key)
                }
                callback(emergenciesID)
            }
        })
        
    }
    
    func getEmergencies(emergenciesID: [String], callback: Emergency -> Void)  {
        //var emergencies: [Emergency] = []
        
        for emergencyID in emergenciesID {
            FIRDatabase.database().reference().child("/emergencies/\(emergencyID)").observeEventType(.ChildAdded, withBlock: { (snapshot) in
                if let emergencyDictionary = snapshot.value as? Dictionary<String, AnyObject> {
                    
                    let emergencyJSON = JSON(emergencyDictionary)
                    let emergency = Emergency.object(fromJSON: emergencyJSON) as! Emergency
                    //emergencies.append(emergency)
                    
                    print("Success with JSON: \(emergencyJSON)")
                    callback(emergency)
                }
            })
        }
    }
}
