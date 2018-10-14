//
//  RegisterTab.swift
//  HackDuke
//
//  Created by Vincent Liu on 10/13/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

import Firebase
import FirebaseCore
import FirebaseDatabase

class Register: UIViewController {
    
    var user: String?

    var ref: DatabaseReference!
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func register(_ sender: Any) {
        let myPhoneNumber = phoneNumber.text
        let myPassword = password.text
        
        self.ref.child(user!).setValue(["phoneNum": myPhoneNumber, "password": myPassword])
        performSegue(withIdentifier: "goToLogin", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        ref = Database.database().reference()
    }
    
}

