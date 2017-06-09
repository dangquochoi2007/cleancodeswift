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

//B88173F8-5680-4C39-B95C-534CB46B4E7A
protocol iBeaconViewControllerInput: iBeaconPresenterOutput {
    
    func displayPromotion(viewModel: iBeaconViewModel.FetchPromotion.ViewModel.DisplayedPromotion)
}

protocol iBeaconViewControllerOutput {
    
   
}

final class iBeaconViewController: UIViewController {
    
    var output: iBeaconViewControllerOutput!
    var router: iBeaconRouterProtocol!
    
    var centralManager: CBCentralManager!
    

    
    
    
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
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        
    }
    
    
    // MARK: - Load data
    func configureViewOnLoad() {
        
        
    }
}



extension iBeaconViewController: CBCentralManagerDelegate {
    
    // MARK: - CBCentralManagerDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch (central.state) {
        case .poweredOn:
            print("power on")
            return
        case .poweredOff:
            print("power off")
            return
        case .unauthorized:
            return
        default:
            print("unknow")
            return
        }
    }
}


extension iBeaconViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    //Passive tracking iPhone home
    
}





// MARK: - iBeaconPresenterOutput

extension iBeaconViewController: iBeaconViewControllerInput {
    
    
    // MARK: - Display logic
    
    func displayPromotion(viewModel: iBeaconViewModel.FetchPromotion.ViewModel.DisplayedPromotion) {
        
    }
}
