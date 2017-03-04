//
//  AuthAPIStore.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class AuthAPIStore {

    
    func postUser(userID: String, withParameter parameters: [String : AnyObject]) {
        
        let URL = NSURL(string: "\(Constants.Server.URI_API)/users/\(userID)")!
        let URLRequest = NSMutableURLRequest(URL: URL)
        
        URLRequest.HTTPMethod = "POST"
        
        URLRequest.setValue("key=\(Constants.Firebase.API_KEY)", forHTTPHeaderField: "Authorization")
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        let encoded = encoding.encode(URLRequest, parameters: parameters).0
        Alamofire.request(encoded)
        
    }
    
    func register(name: String, email: String, password: String) {
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
            if error == nil {
                //registration successful
                let parameters: [String : AnyObject] = [
                    "name": name,
                    "email": email
                ]
                self.postUser(user!.uid, withParameter: parameters)
                
            }else{
                //registration failure
                
            }
        })
        
    }
    
    func login(email: String, password: String, completion: (FIRUser?, NSError?) -> Void) {
        //FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
        FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
            if error == nil {
                completion(user, error)
            } else {
                
            }
        })
        
    }
    
}