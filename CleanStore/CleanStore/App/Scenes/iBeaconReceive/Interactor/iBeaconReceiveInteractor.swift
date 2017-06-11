//
//  iBeaconReceiveInteractor.swift
//  CleanStore
//
//  Created by QuocHoi on 9/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol iBeaconReceiveInteractorInput: iBeaconReceiveViewControllerOutput {

}

protocol iBeaconReceiveInteractorOutput {

    func presentSomething()
}

final class iBeaconReceiveInteractor {

    let output: iBeaconReceiveInteractorOutput
    let worker: iBeaconReceiveWorker


    // MARK: - Initializers

    init(output: iBeaconReceiveInteractorOutput, worker: iBeaconReceiveWorker = iBeaconReceiveWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - iBeaconReceiveInteractorInput

extension iBeaconReceiveInteractor: iBeaconReceiveViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
