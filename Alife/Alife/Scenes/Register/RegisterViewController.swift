//
//  RegisterViewController.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 05/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var authAPIStore: AuthAPIStore = AuthAPIStore()
    
    @IBOutlet var registerTableView: UITableView!
    var email:String = ""
    var password:String = ""
    var name:String = "Alex"
    
    
    var user:User?
    
    override func viewWillDisappear(animated: Bool) {
        //        self.navigationController?.navigationBar.setItems([], animated: true)
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.signOut()
        
        if let user = FIRAuth.auth()?.currentUser {
            //            self.navigationController?.navigationItem.leftBarButtonItems = []
            
            self.performSegueWithIdentifier("emergencySegue", sender: self)
            
            print("Logged in")
        }
        else {
            print("Not logged in")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "emergencySegue") {
            let destinationVC: UITabBarController = segue.destinationViewController as! TabBar
            destinationVC.navigationItem.hidesBackButton = true
            
        }
        
    }
    
    func signOut() {
        do{
            try FIRAuth.auth()?.signOut()
        }
        catch{
            print("Error while signing out!")
        }
    }
    
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
    
    func registerButtonPressed() {
        self.view.endEditing(true)
        self.authAPIStore.register(self.name, email: self.email, password: self.password) { (user) in
            
            self.performSegueWithIdentifier("emergencySegue", sender: self)
            
            print("Logged in")
        }
    }
}


extension RegisterViewController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCellWithIdentifier("appTitleCell") as? AppTitleCell {
                return cell
            }
            
        case 2:
            if let cell = tableView.dequeueReusableCellWithIdentifier("iconTextFieldCell") as? IconTextFieldCell {
                cell.customView.layer.cornerRadius = cell.customView.frame.height / 2
                cell.customView.layer.borderWidth = 2
                cell.customView.layer.borderColor = UIColor(red:0.93, green:0.59, blue:0.58, alpha:1.0).CGColor
                
                cell.customTextField.placeholder = "Email"
                cell.customTextField.tag = 0
                cell.customTextField.delegate = self
                
                return cell
            }
            
        case 3:
            if let cell = tableView.dequeueReusableCellWithIdentifier("iconTextFieldCell") as? IconTextFieldCell {
                cell.customView.layer.cornerRadius = cell.customView.frame.height / 2
                cell.customView.layer.borderWidth = 2
                cell.customView.layer.borderColor = UIColor(red:0.93, green:0.59, blue:0.58, alpha:1.0).CGColor
                cell.customTextField.placeholder = "Password"
                cell.customTextField.secureTextEntry = true
                cell.customTextField.tag = 1
                cell.customTextField.delegate = self
                
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCellWithIdentifier("iconTextFieldCell") as? IconTextFieldCell {
                cell.customView.layer.cornerRadius = cell.customView.frame.height / 2
                cell.customView.layer.borderWidth = 2
                cell.customView.layer.borderColor = UIColor(red:0.93, green:0.59, blue:0.58, alpha:1.0).CGColor
                
                cell.customTextField.placeholder = "Name"
                cell.customTextField.tag = 2
                cell.customTextField.delegate = self
                
                return cell
            }
            
        case 5:
            
            if let cell = tableView.dequeueReusableCellWithIdentifier("buttonCell") as? ButtonCell {
                cell.customButton.addTarget(self, action: #selector(registerButtonPressed), forControlEvents: .TouchUpInside)
                cell.customButton.layer.cornerRadius = 30
                cell.customButton.setTitle("REGISTER", forState: .Normal)
                
                return cell
            }
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.view.endEditing(true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 95
        case 1:
            return 50
        default:
            return 80
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 0 {
            self.email = textField.text!
        }
        else if textField.tag == 1 {
            self.password = textField.text!
        }
        else if textField.tag == 2 {
            self.name = textField.text!
        }
        print(textField.text)
        return true
    }
    
    
}
