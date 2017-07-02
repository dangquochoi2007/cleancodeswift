//
//  TouchTVShowsInteractor.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchTVShowsInteractorInput: TouchTVShowsViewControllerOutput {

}

protocol TouchTVShowsInteractorOutput {

    func presentSomething()
}

final class TouchTVShowsInteractor {

    let output: TouchTVShowsInteractorOutput
    let worker: TouchTVShowsWorker


    // MARK: - Initializers

    init(output: TouchTVShowsInteractorOutput, worker: TouchTVShowsWorker = TouchTVShowsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - TouchTVShowsInteractorInput

extension TouchTVShowsInteractor: TouchTVShowsViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
