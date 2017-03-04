//
//  ChatAPI.swift
//  Alife
//
//  Created by Cristian Miguel Pinto Quinto on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import Alamofire
import Firebase

class ChatAPI {
    
    typealias SendMessageCompletionHandler = (user: User?) -> Void
    
    //  /users/:id/emergencies/:emergencyID/messages
    func sendMessage(userID: String, emergencyID: String, message: String, completion: SendMessageCompletionHandler) {
        let URL = NSURL(string: "\(Constants.Server.URI_API)/users/\(userID)/emergencies/\(emergencyID)/messages")!
        let URLRequest = NSMutableURLRequest(URL: URL)
        
        URLRequest.HTTPMethod = "POST"
        
        URLRequest.setValue("key=\(Constants.Firebase.API_KEY)", forHTTPHeaderField: "Authorization")
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        let parameters: [String: AnyObject] = [
            "message": message
        ]
        
        let encoded = encoding.encode(URLRequest, parameters: parameters).0
        
        Alamofire.request(encoded).responseJSON { (response) in
            
            switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
//                completion(user: User(id: userID, fullname: name, email: email))
                
            case .Failure(let error):
                print(error)
                completion(user: nil)
            }
            
        }
    }
}
