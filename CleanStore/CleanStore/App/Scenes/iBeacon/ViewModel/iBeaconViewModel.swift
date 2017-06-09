//
//  iBeaconViewModel.swift
//  CleanStore
//
//  Created by hoi on 29/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit
import CoreLocation

struct iBeaconViewModel {
    
    struct FetchPromotion {
        
        struct Request {
            
            static let uuid: String = "B88173F8-5680-4C39-B95C-534CB46B4E7A"
            static let beaconIdentifier = "ibeacon.co8xis"
            static let Major: CLBeaconMajorValue = 100
            static let Minor: CLBeaconMinorValue = 1
        }
        
        struct Response {
        
        }
        
        struct ViewModel {
            
            struct DisplayedPromotion {
            }
            
            var displayedPromotion: DisplayedPromotion
        }
    }
}
