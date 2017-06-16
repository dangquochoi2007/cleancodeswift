//
//  FeedsInteractor.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol FeedsInteractorInput: FeedsViewControllerOutput {

}

protocol FeedsInteractorOutput {

    func presentSomething()
}

final class FeedsInteractor {

    let output: FeedsInteractorOutput
    let worker: FeedsWorker


    // MARK: - Initializers

    init(output: FeedsInteractorOutput, worker: FeedsWorker = FeedsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - FeedsInteractorInput

extension FeedsInteractor: FeedsViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
