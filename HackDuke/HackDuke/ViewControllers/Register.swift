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
    
    var myPhoneNumber: String?
    var myPassword: String?
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func register(_ sender: Any) {
        myPhoneNumber = phoneNumber.text
        myPassword = password.text
                
        performSegue(withIdentifier: "goToChoice", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is Choice
        {
            let vc = segue.destination as? Choice
            vc?.myPhoneNumber = myPhoneNumber!
            vc?.myPassword = myPassword!
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
}

