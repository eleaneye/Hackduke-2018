//
//  DelivererHome.swift
//  HackDuke
//
//  Created by David Cheng on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import UIKit

class DelivererHome: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    
    var saved = ["Whole Foods", "Harris Teeter", "Food Lion"]
    var availible = ["Availible Today", "Availible Today", "Availible Tommorow"]
    
    var others = ["Panera", "Limings", "Hmart"]
    var distance = ["2.2 miles", "3.1 miles", "22 miles"]
    
    var selected = ""
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            return saved.count
        }
        
        return others.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView==tableView1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DelivererHomePC1
        
            cell.name.text = saved[indexPath.row]
            cell.availible.text = availible[indexPath.row]
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DelivererHomePC2
            
            cell.name.text = others[indexPath.row]
            cell.distance.text = distance[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView==tableView1 {
            selected = saved[indexPath.row]
        }
        else {
            selected = availible[indexPath.row]
        }
        
       
        
        performSegue(withIdentifier: "selected", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? Delivery
        vc?.receivedStoreName = selected
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
