//
//  iBeaconViewController.swift
//  CleanStore
//
//  Created by hoi on 29/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit
import CoreBluetooth

protocol iBeaconViewControllerInput: iBeaconPresenterOutput {
    
}

protocol iBeaconViewControllerOutput {
    
    func doSomething()
}

final class iBeaconViewController: UIViewController, CBCentralManagerDelegate {
    
    var output: iBeaconViewControllerOutput!
    var router: iBeaconRouterProtocol!
    
    var centralManager:CBCentralManager!
    

    
    
    
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
    
    
    // MARK: - Load data
    
    func doSomethingOnLoad() {
        
        // TODO: Ask the Interactor to do some work
        
        output.doSomething()
    }
    
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
            return;
        default:
            print("unknow")
            return
        }
    }
}


// MARK: - iBeaconPresenterOutput

extension iBeaconViewController: iBeaconViewControllerInput {
    
    
    // MARK: - Display logic
    
    func displaySomething(viewModel: iBeaconViewModel) {
        
        // TODO: Update UI
    }
}
