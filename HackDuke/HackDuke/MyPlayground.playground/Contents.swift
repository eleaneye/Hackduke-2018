import UIKit
import Alamofire


var str = "Hello, playground"

var homeAddress = "304 Parish House Road Cary, NC"

var store = "2107 Hillsborough Rd, Durham, NC 27705"

var receipents = ["3039 E Cornwallis Rd, Research Triangle Park, NC 27709",
                  "100 SAS Campus Dr, Cary, NC 27513",
                  "966 High House Rd #124, Cary, NC 27513"
]

for receipent in receipents {
    print(receipent)
    
    Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/distancematrix/json",
                      parameters: ["units": "imperial"])
        .response { request, response, data, error in
            print(request)
            print(response)
            print(error)
    }
}

