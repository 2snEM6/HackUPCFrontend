//
//  LoginViewController.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var loginTableView: UITableView!
    
    var authAPIStore: AuthAPIStore = AuthAPIStore()
    
    var fakeUsername:String = "Alex"
    var fakeEmail:String = "fake\(Int64(NSDate().timeIntervalSince1970))@gmail.com"
    var fakePassword:String = "test123"
    
    var user:User? 
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.signOut()
        
        if let user = FIRAuth.auth()?.currentUser {
            self.navigationController?.navigationItem.leftBarButtonItems = []
            
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
