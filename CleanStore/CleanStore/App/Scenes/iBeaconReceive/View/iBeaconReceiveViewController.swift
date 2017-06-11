//
//  iBeaconReceiveViewController.swift
//  CleanStore
//
//  Created by QuocHoi on 9/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit
import CoreLocation

protocol iBeaconReceiveViewControllerInput: iBeaconReceivePresenterOutput {

}

protocol iBeaconReceiveViewControllerOutput {

    func doSomething()
}

final class iBeaconReceiveViewController: UIViewController {

    var output: iBeaconReceiveViewControllerOutput!
    var router: iBeaconReceiveRouterProtocol!


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

        doSomethingOnLoad()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
}

extension iBeaconReceiveViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        
    }
}




// MARK: - iBeaconReceivePresenterOutput

extension iBeaconReceiveViewController: iBeaconReceiveViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: iBeaconReceiveViewModel) {

        // TODO: Update UI
    }
}
