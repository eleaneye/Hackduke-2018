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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

class indvSurvey: FormViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let fname: String?, lname: String?, email: String?, phone:String?, bdate:String?
        form +++ Section("General Information")
            
            <<< TextRow(){ row in
                row.title = "First Name"
                row.placeholder = "Enter first name"
            }
            <<< TextRow(){ row in
                row.title = "Last Name"
                row.placeholder = "Enter last name"
            }
            
            <<< PhoneRow(){
                $0.title = "Phone Number"
            }
            
            <<< TextRow(){
                $0.title = "Email Address"
                $0.add(rule: RuleRequired())
                $0.add(rule: RuleEmail())
                $0.validationOptions = .validatesOnChangeAfterBlurred
                $0.placeholder = "Enter email"
            }
            
            <<< DateRow(){
                $0.title = "Birth Date"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
            
            +++ Section("Food Preferences")
            <<< IntRow(){
                $0.title = "How many people are in your household?"
            }
            
            <<< IntRow(){
                $0.title = "How many meals can you provide right now, per week?"
            }
            
            <<< IntRow(){
                $0.title = "How many meals do you need per week?"
            }
            
            <<< PickerInlineRow<String>() {
                $0.title = "Approximate yearly Income"
            
                
                $0.options = ["Less than $5000", "Less than $15,000", "Less than $30,000", "Less than $50,000", "More than $50,000"]
                $0.value = "More than $50,000"    // initially selected
            }
            
            <<< PickerInlineRow<String>() {
                $0.title = "Which days can you receive food?"
            
                $0.options = ["Mondays", "Tuesdays", "Wednesdays", "Thursdays", "Fridays", "Saturdays", "Sundays"]
                $0.value = "Mondays"    // initially selected
            }
            +++ Section("Food Preferences Cont.")
            <<< TextAreaRow(){
                $0.title = "Allergies"
                $0.placeholder = "Enter any allergies, or NA if none."
            }
        
        
        
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
            <<< IntRow(){
                $0.title = "How many meals ca"
            }
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
}
