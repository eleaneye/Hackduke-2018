//
//  Choice.swift
//  HackDuke
//
//  Created by Vincent Liu on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import UIKit


class Choice: UIViewController {
    
    @IBOutlet weak var RecipientButton: UIButton!
    @IBOutlet weak var DelivererButton: UIButton!
    @IBOutlet weak var DonatorButton: UIButton!
    var user: String?
    
    @IBAction func recipientTapped(_ sender: Any) {
        user = "Recipient"
        performSegue(withIdentifier: "goToRegister", sender: nil)
    }
    
    @IBAction func delivererTapped(_ sender: Any) {
        user = "Deliverer"
        performSegue(withIdentifier: "goToRegister", sender: nil)
    }

    @IBAction func donatorTapped(_ sender: Any) {
        user = "Donator"
        performSegue(withIdentifier: "goToRegister", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is Choice
        {
            let vc = segue.destination as? Choice
            vc?.user = user
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }

}
