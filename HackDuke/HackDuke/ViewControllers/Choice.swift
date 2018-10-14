//
//  Choice.swift
//  HackDuke
//
//  Created by Vincent Liu on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

import Firebase
import FirebaseCore
import FirebaseDatabase


class Choice: UIViewController {
    var myPhoneNumber: String?
    var myPassword: String?
    var ref: DatabaseReference!

    
    @IBOutlet weak var RecipientButton: UIButton!
    @IBOutlet weak var DelivererButton: UIButton!
    @IBOutlet weak var DonatorButton: UIButton!
    
    @IBAction func recipientTapped(_ sender: Any) {
        self.ref.child(myPhoneNumber!).child(myPassword!).setValue(["type": "Recipient"])
        performSegue(withIdentifier: "Recipient", sender: nil)
    }
    
    @IBAction func delivererTapped(_ sender: Any) {
        self.ref.child(myPhoneNumber!).child(myPassword!).setValue(["type": "Deliverer"])
        performSegue(withIdentifier: "Deliverer", sender: nil)
    }

    @IBAction func donatorTapped(_ sender: Any) {
    self.ref.child(myPhoneNumber!).child(myPassword!).setValue(["type": "Donator"])
        performSegue(withIdentifier: "Donator", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        }

}
