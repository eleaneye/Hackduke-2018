//
//  ViewController.swift
//  HackDuke
//
//  Created by David Cheng on 10/13/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import UIKit
import Alamofire

import Firebase
import FirebaseCore
import FirebaseDatabase


class LogIn: UIViewController {
    
    var ref: DatabaseReference!


    @IBOutlet weak var register: UIButton!
    
    @IBOutlet weak var phoneNumber: UITextField!
    

    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var logButton: UIButton!
    
    @IBAction func logIn(_ sender: Any) {
        let myPhoneNumber = phoneNumber.text
        let myPassword = password.text
        
        ref.observe(DataEventType.value, with: { (snapshot) in

        //iterating through all the values
            for users in snapshot.children.allObjects as! [DataSnapshot] {
            //getting values
            let userObject = users.value as? [String: AnyObject]
            let thisphoneNumber  = userObject?[myPhoneNumber!]
                print(thisphoneNumber)
                if ((thisphoneNumber?.isEqual(myPhoneNumber))!) {
                    let thistype  = userObject?[myPassword!]
                    print(thistype)
                    self.performSegue(withIdentifier: thistype as! String, sender: nil)
            }
        }
        })
        }
    
    @IBAction func register(_ sender: Any) {
        performSegue(withIdentifier: "register", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref = Database.database().reference()
       
    }

}

