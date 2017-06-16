//
//  SignInInteractor.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SignInInteractorInput: SignInViewControllerOutput {

}

protocol SignInInteractorOutput {

    func presentSomething()
}

final class SignInInteractor {

    let output: SignInInteractorOutput
    let worker: SignInWorker


    // MARK: - Initializers

    init(output: SignInInteractorOutput, worker: SignInWorker = SignInWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - SignInInteractorInput

extension SignInInteractor: SignInViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
