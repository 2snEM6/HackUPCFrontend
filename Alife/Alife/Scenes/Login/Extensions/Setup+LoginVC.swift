//
//  Setup+LoginVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit


extension LoginViewController {
    
    
    func setupUI() {
        self.hideKeyboardOnTouch()
    }
    
    func hideKeyboardOnTouch() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(dismissKeyboard()))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
