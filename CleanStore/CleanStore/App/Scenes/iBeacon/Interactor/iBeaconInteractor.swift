//
//  iBeaconInteractor.swift
//  CleanStore
//
//  Created by hoi on 29/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol iBeaconInteractorInput: iBeaconViewControllerOutput {

}

protocol iBeaconInteractorOutput {

    func presentSomething()
}

final class iBeaconInteractor {

    let output: iBeaconInteractorOutput
    let worker: iBeaconWorker


    // MARK: - Initializers

    init(output: iBeaconInteractorOutput, worker: iBeaconWorker = iBeaconWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - iBeaconInteractorInput

extension iBeaconInteractor: iBeaconViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
