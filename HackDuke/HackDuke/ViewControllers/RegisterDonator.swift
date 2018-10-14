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
        form +++ Section("Section1")
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }

            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
}
