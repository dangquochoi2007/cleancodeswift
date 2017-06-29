//
//  TouchMovieInteractor.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchMovieInteractorInput: TouchMovieViewControllerOutput {

}

protocol TouchMovieInteractorOutput {

    func presentSomething()
}

final class TouchMovieInteractor {

    let output: TouchMovieInteractorOutput
    let worker: TouchMovieWorker


    // MARK: - Initializers

    init(output: TouchMovieInteractorOutput, worker: TouchMovieWorker = TouchMovieWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - TouchMovieInteractorInput

extension TouchMovieInteractor: TouchMovieViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
