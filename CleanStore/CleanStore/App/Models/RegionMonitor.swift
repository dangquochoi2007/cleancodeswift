//
//  RegionMonitor.swift
//  CleanStore
//
//  Created by hoi on 29/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import CoreLocation

protocol RegionMonitorDelegate: NSObjectProtocol {
    func onBackgroundLocationAccessDisabled()
    func didStartMonitoring()
    func didStopMonitoring()
    func didEnterRegion(region: CLRegion!)
    func didExitRegion(region: CLRegion!)
    func didRangeBeacon(beacon: CLBeacon!, region: CLRegion)
    func onError(error: NSError)
}

class RegionMonitor: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    var beaconRegion: CLBeaconRegion?
    
    var rangedBeacon: CLBeacon! = CLBeacon()
    var pendingMonitorRequest: Bool = false
    weak var delegate: RegionMonitorDelegate?
    
    
    init(delegate: RegionMonitorDelegate) {
        super.init()
        self.delegate = delegate
        self.locationManager = CLLocationManager()
        self.locationManager!.delegate = self
    }
    
    
  
}
