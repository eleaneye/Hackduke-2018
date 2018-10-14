//
//  RegisterDeliver.swift
//  HackDuke
//
//  Created by David Cheng on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import Eureka

class RegisterDonator: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("Organization Type")
            <<< CheckRow(){
                $0.title = "Restaurant"
                
            }
            <<< CheckRow(){
                $0.title = "Grocery Store"
            }
            <<< CheckRow(){
                $0.title = "Farm"
            }
            <<< TextRow(){ row in
                row.title = "Other: "
                row.placeholder = "Enter text here"
        }
    }
}
