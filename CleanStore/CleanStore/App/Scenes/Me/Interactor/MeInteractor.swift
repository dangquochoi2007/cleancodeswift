//
//  MeInteractor.swift
//  CleanStore
//
//  Created by hoi on 30/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MeInteractorInput: MeViewControllerOutput {

}

protocol MeInteractorOutput {

    func presentSomething()
}

final class MeInteractor {

    let output: MeInteractorOutput
    let worker: MeWorker


    // MARK: - Initializers

    init(output: MeInteractorOutput, worker: MeWorker = MeWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - MeInteractorInput

extension MeInteractor: MeViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
