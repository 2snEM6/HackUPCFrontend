//
//  TableView+LoginVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

extension LoginViewController {
    
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
                if let cell = tableView.dequeueReusableCellWithIdentifier("buttonCell") as? ButtonCell {
                    
                    
                    cell.customButton.layer.cornerRadius = 30
                    cell.customButton.setTitle("LOGIN", forState: .Normal)
                    cell.customButton.addTarget(self, action: #selector(loginButtonPressed), forControlEvents: .TouchUpInside)
                    
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
        print(textField.text)
        return true
    }
    
    
}
