//
//  DeliveryConfirm.swift
//  HackDuke
//
//  Created by David Cheng on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import UIKit

class DeliveryConfirm:UIViewController {
    var receivedDuration:Int = -1
    var receivedAddress:String = ""
    
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var address: UILabel!
    
    @IBAction func confirm(_ sender: Any) {
        let latitude = 0
        let longitude = 0
        
        UIApplication.shared.openURL(URL(string:"comgooglemaps://?saddr=&daddr=\(Float(latitude)),\(Float(longitude))&directionsmode=driving")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        duration.text = String(receivedDuration) + " Minute(s)"
        address.text = receivedAddress
    }
}
