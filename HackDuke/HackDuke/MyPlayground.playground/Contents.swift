import UIKit
import Alamofire


var str = "Hello, playground"

var homeAddress = "304 Parish House Road Cary, NC"

var store = "2107 Hillsborough Rd, Durham, NC 27705"

var receipents = ["3039 E Cornwallis Rd, Research Triangle Park, NC 27709",
                  "100 SAS Campus Dr, Cary, NC 27513",
                  "966 High House Rd #124, Cary, NC 27513"
]

var threshold = 5


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
                let result = Int(text.replacingOccurrences(of: " mins", with: ""))!
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

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

myGroup.notify(queue: .main) {
    for receipent in receipents {
        sum[receipent] = stage1[receipent]! + stage2[receipent]!
    }
    
    let min = sum.values.min()!
    let diff = min - original
    
    if diff <= threshold {
        let address = sum.someKey(forValue: min)!
        
        print("Found address within threshold: " + address)
    } else {
        print("None within threshold")
    }
    
}
