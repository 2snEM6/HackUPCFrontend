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
        
        self.authAPIStore.login(self.email, password: self.password) { (user, error) in
            
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
        self.performSegueWithIdentifier("registerScene", sender: self)
    }
}
