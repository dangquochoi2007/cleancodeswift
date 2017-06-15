//
//  iBeaconReceiveViewController.swift
//  CleanStore
//
//  Created by QuocHoi on 9/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//
import UIKit
import CoreLocation
import Speech
// https://developer.apple.com/library/content/samplecode/SpeakToMe/Listings/SpeakToMe_ViewController_swift.html
// https://www.raywenderlich.com/136165/core-location-geofencing-tutorial
// http://exploringlightswitch.blogspot.com/2014/08/working-with-ibeacons-in-swift.html

protocol iBeaconReceiveViewControllerInput: iBeaconReceivePresenterOutput {
    
}

protocol iBeaconReceiveViewControllerOutput {
    
  
}

final class iBeaconReceiveViewController: UIViewController {
    
    var output: iBeaconReceiveViewControllerOutput!
    var router: iBeaconReceiveRouterProtocol!
    
    var beaconRegion: CLBeaconRegion!
    var locationManager: CLLocationManager!
    
    var isSearchingForBeacons = false
    
    var lastFoundBeacon: CLBeacon! = CLBeacon()
    var lastProximity: CLProximity! = CLProximity.unknown
    
    lazy var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    
    @IBOutlet weak var beaconDetailLabel: UILabel!
    
    // MARK: - Initializers
    init(configurator: iBeaconReceiveConfigurator = iBeaconReceiveConfigurator.sharedInstance) {
        
        super.init(nibName: "iBeaconReceiveViewController", bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    
    // MARK: - Configurator
    private func configure(configurator: iBeaconReceiveConfigurator = iBeaconReceiveConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        initLocationManager()
    }
    
    
    
    @IBAction func spottingButtonPressed(_ sender: UIButton) {
        
        if !isSearchingForBeacons {
            
            locationManager.requestAlwaysAuthorization()
            locationManager.startMonitoring(for: beaconRegion)
            locationManager.startUpdatingLocation()
            isSearchingForBeacons = true
            
            sender.setTitle("Searching", for: UIControlState.normal)
        } else {
        
            locationManager.stopMonitoring(for: beaconRegion)
            locationManager.stopRangingBeacons(in: beaconRegion)
            locationManager.stopUpdatingLocation()
            isSearchingForBeacons = false
            
            sender.setTitle("Search", for: UIControlState.normal)
        }
    }
    
    
    // MARK: - Load data
    func doSomethingOnLoad() {
        
        // TODO: Ask the Interactor to do some work
     
    }
    
    
    func initLocationManager() {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        let uuidString = iBeaconReceiveViewModel.iBeaconSpot.Request.uuid
        let identifier = iBeaconReceiveViewModel.iBeaconSpot.Request.beaconIdentifier
        
        let uuid = UUID(uuidString: uuidString)!
        beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: identifier)
        
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
        
    }
}

extension iBeaconReceiveViewController: CLLocationManagerDelegate {
    
    // MARK: Responding to Region Events
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
        locationManager.requestState(for: beaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("Monitoring failed for region with identifier: \(String(describing: region?.identifier))")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager failed with the following error: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        
        var locationState: String = "Beacon Details: "
        switch state {
        case .inside:
            locationState += "inside"
        case .outside:
            locationState += "outside"
        case .unknown:
            locationState += "unknow"
        }
        
        beaconDetailLabel.text = locationState
    }
    
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
        print("User have out the range beacon")
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
    
        print("User have in the range beacon")
    }
    // MARK : Responding to Ranging Events
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        print("Found \(beacons.count) iBeacon(s) in region: \(region.identifier)")
    }
    
    
}




// MARK: - iBeaconReceivePresenterOutput
extension iBeaconReceiveViewController: iBeaconReceiveViewControllerInput {
    
    
    // MARK: - Display logic
    func displaySomething(viewModel: iBeaconReceiveViewModel) {
        
        // TODO: Update UI
    }
}
