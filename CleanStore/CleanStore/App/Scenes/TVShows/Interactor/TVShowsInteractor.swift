//
//  TVShowsInteractor.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowsInteractorInput: TVShowsViewControllerOutput {

}

protocol TVShowsInteractorOutput {

    func presentSomething()
}

final class TVShowsInteractor {

    let output: TVShowsInteractorOutput
    let worker: TVShowsWorker


    // MARK: - Initializers

    init(output: TVShowsInteractorOutput, worker: TVShowsWorker = TVShowsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - TVShowsInteractorInput

extension TVShowsInteractor: TVShowsViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
