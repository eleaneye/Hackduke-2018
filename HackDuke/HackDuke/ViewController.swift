//
//  ViewController.swift
//  HackDuke
//
//  Created by David Cheng on 10/13/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var ref: DatabaseReference = Database.database().reference()
    
    let ap = ref.initializeApp(config)
    let db = ap.database()
    var users = db.ref("Users")
    @IBOutlet weak var phoneNumber: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var logButton: UIButton!
    
    @IBAction func logIn(_ sender: Any) {
        let myPhoneNumber = phoneNumber.text
        let myPassword = password.text
        
        logButton.tintColor=UIColor.black;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }

}

