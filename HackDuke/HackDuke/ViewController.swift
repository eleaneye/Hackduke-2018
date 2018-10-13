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

    @IBOutlet weak var userName: UITextField!
    @IBAction func getUserName(_ sender: Any) {
        var myUserName: String = userName.text ?? ""
    }
    
    @IBOutlet weak var myButton: UIButton!
    @IBAction func onPress(_ sender: Any) {
        myButton.tintColor=UIColor.black;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

