//
//  TableView+ChatListVC.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

extension ChatListViewController {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("chatListCell") as? ChatListCell {
            
            var type:Int = 0
            
            if indexPath.row % 3 == 0 {
                type = 2
            }
            else if indexPath.row % 2 == 0 {
                type = 1
            }
            
            cell.emergencyLocationTextView.text = "Emergency in Barcelona"
            cell.gravityColor.layer.cornerRadius = cell.gravityColor.frame.height / 2
            switch type {
            case 0:
                cell.emergencyGravityTextView.text = "22 minutes ago"
                cell.gravityColor.backgroundColor = UIColor(red:0.81, green:0.24, blue:0.24, alpha:1.0)
            case 1:
                cell.emergencyGravityTextView.text = "Less than a minute"
                cell.gravityColor.backgroundColor = UIColor(red:0.89, green:0.45, blue:0.08, alpha:1.0)
            case 2:
                cell.emergencyGravityTextView.text = "15 minutes ago"
                cell.gravityColor.backgroundColor = UIColor(red:1.00, green:0.90, blue:0.00, alpha:1.0)
            default:
                cell.emergencyGravityTextView.text = "Right now"
                cell.gravityColor.backgroundColor = UIColor(red:1.00, green:0.90, blue:0.00, alpha:1.0)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
