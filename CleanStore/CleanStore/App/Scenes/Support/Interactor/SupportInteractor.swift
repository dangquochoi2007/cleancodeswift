//
//  SupportInteractor.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SupportInteractorInput: SupportViewControllerOutput {

}

protocol SupportInteractorOutput {

    func presentSomething()
}

final class SupportInteractor {

    let output: SupportInteractorOutput
    let worker: SupportWorker


    // MARK: - Initializers

    init(output: SupportInteractorOutput, worker: SupportWorker = SupportWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - SupportInteractorInput

extension SupportInteractor: SupportViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
