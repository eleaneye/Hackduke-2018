//
//  DelivererHomeTV1.swift
//  HackDuke
//
//  Created by David Cheng on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import UIKit

class DelivererHomeTV1:UITableViewController {
    var saved = ["Whole Foods", "Harris Teeter", "Food Lion", "Panera", "Limings", "Hmart"]
    var availible = ["Availible Today", "Availible Tommorow", "Availible Today", "Availible 10/24", "Availible Today", "Availible Today"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saved.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DelivererHomePC1
        
        cell.name.text = saved[indexPath.row]
        cell.availible.text = saved[indexPath.row]
        return cell
    }
    
    
    
}
