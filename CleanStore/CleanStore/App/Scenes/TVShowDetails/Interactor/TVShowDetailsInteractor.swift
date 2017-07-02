//
//  TVShowDetailsInteractor.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowDetailsInteractorInput: TVShowDetailsViewControllerOutput {

}

protocol TVShowDetailsInteractorOutput {

    func presentSomething()
}

final class TVShowDetailsInteractor {

    let output: TVShowDetailsInteractorOutput
    let worker: TVShowDetailsWorker


    // MARK: - Initializers

    init(output: TVShowDetailsInteractorOutput, worker: TVShowDetailsWorker = TVShowDetailsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - TVShowDetailsInteractorInput

extension TVShowDetailsInteractor: TVShowDetailsViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
