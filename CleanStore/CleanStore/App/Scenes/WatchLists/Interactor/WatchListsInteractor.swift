//
//  WatchListsInteractor.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol WatchListsInteractorInput: WatchListsViewControllerOutput {

}

protocol WatchListsInteractorOutput {

    func presentSomething()
}

final class WatchListsInteractor {

    let output: WatchListsInteractorOutput
    let worker: WatchListsWorker


    // MARK: - Initializers

    init(output: WatchListsInteractorOutput, worker: WatchListsWorker = WatchListsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - WatchListsInteractorInput

extension WatchListsInteractor: WatchListsViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
