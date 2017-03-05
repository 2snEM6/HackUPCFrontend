//
//  LoginViewController.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet var loginTableView: UITableView!
    
    var authAPIStore: AuthAPIStore = AuthAPIStore()

    let fields:[UITableViewCell] = []
    var email:String = ""
    var password:String = ""
    
    
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
    
    
}
