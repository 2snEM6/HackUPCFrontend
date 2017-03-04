//
//  Buttons+LoginVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

extension LoginViewController {
    
    
    func loginButtonPressed() {
        
        self.authAPIStore.login(self.fakeEmail, password: self.fakePassword) { (user, error) in
            
            if let error = error {
                print(error)
            }
            else {
                self.performSegueWithIdentifier("emergencySegue", sender: self)
                
                print("Logged in")
            }
            
        }
    
    }
    
    func registerButtonPressed() {
        
        self.authAPIStore.register(self.fakeUsername, email: self.fakeEmail, password: self.fakePassword) { (user) in
            
            self.performSegueWithIdentifier("emergencySegue", sender: self)
            
            print("Logged in")
        }
    }
}
