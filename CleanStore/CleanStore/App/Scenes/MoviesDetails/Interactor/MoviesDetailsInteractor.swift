//
//  MoviesDetailsInteractor.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesDetailsInteractorInput: MoviesDetailsViewControllerOutput {

}

protocol MoviesDetailsInteractorOutput {

    func presentSomething()
}

final class MoviesDetailsInteractor {

    let output: MoviesDetailsInteractorOutput
    let worker: MoviesDetailsWorker


    // MARK: - Initializers

    init(output: MoviesDetailsInteractorOutput, worker: MoviesDetailsWorker = MoviesDetailsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - MoviesDetailsInteractorInput

extension MoviesDetailsInteractor: MoviesDetailsViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
