//
//  MoviesInteractor.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesInteractorInput: MoviesViewControllerOutput {

}

protocol MoviesInteractorOutput {

    func presentSomething()
}

final class MoviesInteractor {

    let output: MoviesInteractorOutput
    let worker: MoviesWorker


    // MARK: - Initializers

    init(output: MoviesInteractorOutput, worker: MoviesWorker = MoviesWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - MoviesInteractorInput

extension MoviesInteractor: MoviesViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
