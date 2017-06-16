//
//  SignUpInteractor.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SignUpInteractorInput: SignUpViewControllerOutput {

}

protocol SignUpInteractorOutput {

    func presentSomething()
}

final class SignUpInteractor {

    let output: SignUpInteractorOutput
    let worker: SignUpWorker


    // MARK: - Initializers

    init(output: SignUpInteractorOutput, worker: SignUpWorker = SignUpWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - SignUpInteractorInput

extension SignUpInteractor: SignUpViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
