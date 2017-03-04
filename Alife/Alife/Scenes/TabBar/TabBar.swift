//
//  TabBar.swift
//  Alife
//
//  Created by Alex Cuello ortiz on 04/03/2017.
//  Copyright © 2017 HackUPC. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedIndex = 1
        
        print(self.tabBar.items?.count)
        
        let unselectedColor:UIColor = UIColor.whiteColor()
        
        for item in self.tabBar.items! {
        
            item.image = item.selectedImage?.imageWithColor(unselectedColor).imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            //In case you wish to change the font color as well
            let attributes = [NSForegroundColorAttributeName: unselectedColor]
            item.setTitleTextAttributes(attributes, forState: UIControlState.Normal)
        }
    }
}


