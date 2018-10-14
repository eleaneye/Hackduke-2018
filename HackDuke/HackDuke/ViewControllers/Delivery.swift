//
//  Delivery.swift
//  HackDuke
//
//  Created by David Cheng on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import UIKit
import GooglePlacePicker
import Alamofire

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

class Delivery: UIViewController, GMSPlacePickerViewControllerDelegate {
    @IBOutlet weak var home:UIButton!
    @IBOutlet weak var otherLocation: UIButton!
    @IBOutlet weak var storeName: UILabel!
    
    var homeAddress = "102 Wannamaker Drive Durham,NC"
    
    var storeAddresses = ["Whole Foods": "621 Broad St, Durham, NC 27705",
                          "Harris Teeter": "2107 Hillsborough Rd, Durham, NC 27705",
                          "Food Lion": "2930 W Main St, Durham, NC 27705",
                          "Panera": "737 9th St, Durham, NC 27705",
                          "Limings": "3400 Westgate Dr, Durham, NC 27707",
                          "Hmart": "1961 High House Rd, Cary, NC 27519"
    ]
    
    var address:String?
    
    var receivedStoreName:String?
    
    let defaultBlue = UIColor(red:0.0, green:122.0/255.0, blue:1.0, alpha:1.0)
    
    @IBAction func homeSelected(_ sender:Any) {
        home.backgroundColor = UIColor.black
        home.tintColor = UIColor.white
        
        address = homeAddress
        
        otherLocation.backgroundColor = UIColor.white
        otherLocation.tintColor =  defaultBlue
    }
    
    @IBAction func selectOtherLocation(_ sender: Any) {
        otherLocation.backgroundColor = UIColor.black
        otherLocation.tintColor = UIColor.white
        
        home.backgroundColor = UIColor.white
        home.tintColor = defaultBlue
        
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePickerViewController(config: config)
        placePicker.delegate = self
        
        present(placePicker, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var now: UIButton!
    @IBOutlet weak var selectTime: UIButton!
    @IBAction func nowSelected(_ sender: Any) {
        now.backgroundColor = UIColor.black
        now.tintColor = UIColor.white
        
        selectTime.backgroundColor = UIColor.white
        selectTime.tintColor =  defaultBlue
    }
    @IBAction func selectTimeSelected(_ sender: Any) {
        selectTime.backgroundColor = UIColor.black
        selectTime.tintColor = UIColor.white
        
        now.backgroundColor = UIColor.white
        now.tintColor =  defaultBlue
    }
    
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        viewController.dismiss(animated: true, completion: nil)
        
        if (place.formattedAddress != nil) {
            address = place.formattedAddress
        } else {
            address = place.name
        }
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
        
        home.backgroundColor = UIColor.white
        home.tintColor = defaultBlue
        
        otherLocation.backgroundColor = UIColor.white
        otherLocation.tintColor = defaultBlue
    }
    
    var diff:Int = 0
    var recipient: String = ""
    
    @IBAction func submit(_ sender: Any) {
        let store = storeAddresses[receivedStoreName!]!
        
        print(store)
        
//        let store = "3039 E Cornwallis Rd, Research Triangle Park, NC 27709"
        let receipents = ["3039 E Cornwallis Rd, Research Triangle Park, NC 27709",
                          "100 SAS Campus Dr, Cary, NC 27513",
                          "966 High House Rd #124, Cary, NC 27513"
        ]
        
        let myGroup = DispatchGroup()
        
        var original:Int = 0;
        var stage1 = [String:Int]();
        var stage2 = [String:Int]();
        var sum = [String:Int]();
        
        var parameters = [
            "units": "imperial",
            "key": "AIzaSyBg_NuQxdUewCsfbmJRUIpIj0qZKVnM24A",
            "destinations": homeAddress,
            "origins": store
        ]
        
        myGroup.enter()
        Alamofire.request("https://maps.googleapis.com/maps/api/distancematrix/json", parameters: parameters)
            .responseJSON { response in
                if let json = response.result.value as? NSDictionary {
                    let rows = (((json["rows"]! as! [NSDictionary])[0]["elements"]!) as! [NSDictionary])[0]["duration"]!
                    let text = (rows as! NSDictionary)["text"]! as! String
                    let result = Int(text.replacingOccurrences(of: " mins", with: ""))!
                    original = result
                }
                myGroup.leave()
        }
        
        for receipent in receipents {
            parameters["origins"] = store
            parameters["destinations"] = receipent
            
            myGroup.enter()
            Alamofire.request("https://maps.googleapis.com/maps/api/distancematrix/json", parameters: parameters)
                .responseJSON { response in
                    if let json = response.result.value as? NSDictionary {
                        let rows = (((json["rows"]! as! [NSDictionary])[0]["elements"]!) as! [NSDictionary])[0]["duration"]!
                        let text = (rows as! NSDictionary)["text"]! as! String
                        let result = Int(text.replacingOccurrences(of: " mins", with: "").replacingOccurrences(of: " min", with: ""))!
                        stage1[receipent] = result
                    }
                    myGroup.leave()
            }
            
            parameters["origins"] = receipent
            parameters["destinations"] = homeAddress
            myGroup.enter()
            Alamofire.request("https://maps.googleapis.com/maps/api/distancematrix/json", parameters: parameters)
                .responseJSON { response in
                    if let json = response.result.value as? NSDictionary {
                        let rows = (((json["rows"]! as! [NSDictionary])[0]["elements"]!) as! [NSDictionary])[0]["duration"]!
                        let text = (rows as! NSDictionary)["text"]! as! String
                        let result = Int(text.replacingOccurrences(of: " mins", with: "").replacingOccurrences(of: " min", with: ""))!
                        stage2[receipent] = result
                    }
                    myGroup.leave()
            }
        }
        
        
        
        myGroup.notify(queue: .main) {
            for receipent in receipents {
                sum[receipent] = stage1[receipent]! + stage2[receipent]!
            }
            
            let min = sum.values.min()!
            self.diff = min - original
            
    
            self.recipient = sum.someKey(forValue: min)!
            
            self.performSegue(withIdentifier: "toConfirm", sender: nil)
            
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DeliveryConfirm
        vc?.receivedDuration = diff
        vc?.receivedAddress = recipient
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeName.text = receivedStoreName
    }
    
}
