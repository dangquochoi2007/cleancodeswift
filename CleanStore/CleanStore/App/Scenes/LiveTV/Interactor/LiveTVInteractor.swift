//
//  LiveTVInteractor.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol LiveTVInteractorInput: LiveTVViewControllerOutput {

}

protocol LiveTVInteractorOutput {

    func presentSomething()
}

final class LiveTVInteractor {

    let output: LiveTVInteractorOutput
    let worker: LiveTVWorker


    // MARK: - Initializers

    init(output: LiveTVInteractorOutput, worker: LiveTVWorker = LiveTVWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - LiveTVInteractorInput

extension LiveTVInteractor: LiveTVViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
