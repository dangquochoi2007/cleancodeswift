//
//  iBeaconViewController.swift
//  CleanStore
//
//  Created by hoi on 29/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

// iBeacon transit data
protocol iBeaconViewControllerInput: iBeaconPresenterOutput {
    
    func displayPromotion(viewModel: iBeaconViewModel.FetchPromotion.ViewModel.DisplayedPromotion)
}

protocol iBeaconViewControllerOutput {
    
   
}

final class iBeaconViewController: UIViewController {
    
    var output: iBeaconViewControllerOutput!
    var router: iBeaconRouterProtocol!
    
    var localBeaconRegion: CLBeaconRegion!
    var beaconPeripheralData: NSDictionary!
    var beaconPeripheralManager: CBPeripheralManager!
    
    
    @IBOutlet weak var uuidTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var minorTextField: UITextField!
    
    @IBOutlet weak var bluetoothStatusLabel: UILabel!
    @IBOutlet weak var beaconStatusLabel: UILabel!
    
    
    
    // MARK: - Initializers
    
    init(configurator: iBeaconConfigurator = iBeaconConfigurator.sharedInstance) {
        
        super.init(nibName: "iBeaconViewController", bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    
    
    // MARK: - Configurator
    
    private func configure(configurator: iBeaconConfigurator = iBeaconConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        
    }
    
    
    // MARK: - Load data
    func configureViewOnLoad() {
        
        
    }
    
    @IBAction func startBeaconButtonPressed(_ sender: UIButton) {
        initLocalBeacon()
    }
    
    
    
    func initLocalBeacon() {
        print("start transmit")
        if localBeaconRegion != nil {
            
            stopLocalBeacon()
        }
        
        let localBeaconUUID = "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5"
        let localBeaconMajor: CLBeaconMajorValue = 1233
        let localBeaconMinor: CLBeaconMinorValue = 45
        let localBeaconIdentifier: String = "co8xis.agency.ibeacon"
        
        let proximityUUID = UUID(uuidString: localBeaconUUID)!
        localBeaconRegion = CLBeaconRegion(proximityUUID: proximityUUID, major: localBeaconMajor, minor: localBeaconMinor, identifier: localBeaconIdentifier)
        beaconPeripheralData = localBeaconRegion.peripheralData(withMeasuredPower: nil)
        beaconPeripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
        
    }
    
    
    func stopLocalBeacon() {
        
        beaconPeripheralManager.stopAdvertising()
        beaconPeripheralManager = nil
        beaconPeripheralData = nil
        localBeaconRegion = nil
    }
    
}

// Trasmit peripharal manager
extension iBeaconViewController: CBPeripheralManagerDelegate {

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        
        if (peripheral.state == .poweredOn) {
        
            peripheral.startAdvertising(beaconPeripheralData as! [String: AnyObject])
            print("Powered On")
        } else if (peripheral.state == .poweredOff) {
            
            peripheral.stopAdvertising()
            print("Not Powered On, or some other error")
        }
        
        switch peripheral.state {
        case .poweredOn:
            peripheral.startAdvertising(beaconPeripheralData as! [String: AnyObject])
            print("Powered On")
        case .poweredOff:
            peripheral.stopAdvertising()
            print("Not Powered On, or some other error")
        case .unauthorized:
            print("Not allow")
        case .unsupported:
            print("un support")
        case .resetting:
            print("resetting")
        case .unknown:
            print("unknow")
        }
    }
}






// MARK: - iBeaconPresenterOutput

extension iBeaconViewController: iBeaconViewControllerInput {
    
    
    // MARK: - Display logic
    
    func displayPromotion(viewModel: iBeaconViewModel.FetchPromotion.ViewModel.DisplayedPromotion) {
        
    }
}
