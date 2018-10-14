//
//  RegisterDeliver.swift
//  HackDuke
//
//  Created by David Cheng on 10/14/18.
//  Copyright © 2018 CDEV. All rights reserved.
//

import Foundation
import Eureka
import GooglePlacePicker

class RegisterDeliverer: FormViewController, GMSPlacePickerViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Your Information")
            <<< TextRow(){ row in
                row.title = "Name"
                row.placeholder = "Enter Name"
            }
            <<< IntRow(){
                $0.title = "Age"
                $0.placeholder = "Enter Age"
            }
            
        +++ Section("Used to determine optimal routes")
            <<< LabelRow(){ row in
                row.title = "Address"
                row.value = "Enter Address"
                row.tag = "address"
                }.onCellSelection({_,_ in
                    self.showMap()
                })
            
        +++ Section("Maximum extra time to add to commutes")
            <<< IntRow(){
                $0.title = "Minutes"
                $0.placeholder = "Enter Time"
            }
        
        +++ SelectableSection<ListCheckRow<String>>("Where do you shop", selectionType: .multipleSelection)
        
        
        let stores = ["Whole Foods", "Harris Teeter", "Food Lion", "Panera", "Limings", "Hmart"]
        let distance = ["2.3 miles", "2.4 miles", "2.4 miles", "2.5 miles", "4.4 miles", "22.1 miles"]
        
        for x in 0..<stores.endIndex {
            form.last! <<< ListCheckRow<String>(stores[x]){ listRow in
                listRow.title = stores[x] + " (" + distance[x] + ")"
                listRow.selectableValue = stores[x]
                listRow.value = nil
            }
        }
        
        
        
    }
    
    func showMap() {
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePickerViewController(config: config)
        placePicker.delegate = self
        
        present(placePicker, animated: true, completion: nil)
    }
    
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        
        if (place.formattedAddress != nil) {
            form.setValues(["address": place.formattedAddress])
        } else {
            form.setValues(["address": place.name])
        }
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
    }
}
