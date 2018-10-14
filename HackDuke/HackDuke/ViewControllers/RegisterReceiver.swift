//
//  RegisterDeliver.swift
//  HackDuke
//
//  Created by David Cheng on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import Eureka
import UIKit

class RegisterReceiver: UIViewController {
    
    @IBOutlet weak var makeOrg: UIButton!
    @IBOutlet weak var makeIndividual: UIButton!
    
//    @IBAction func orgAcct(_ sender: Any) {
//        performSegue(withIdentifier: "org", sender: nil)
//    }
//    
//    @IBAction func indvAcct(_ sender: Any) {
//        performSegue(withIdentifier: "indv", sender: nil)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

class orgSurvey: FormViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let fname: String?, lname: String?, email: String?, phone:String?, bdate:String?
        form +++ Section("Section1")
            
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow(){
                $0.title = "Phone Row"
                $0.placeholder = "And numbers here"
            }
            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
}

class indvSurvey: FormViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let fname: String?, lname: String?, email: String?, phone:String?, bdate:String?
        form +++ Section("Section1")
            
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow(){
                $0.title = "Phone Row"
                $0.placeholder = "And numbers here"
            }
            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
}
