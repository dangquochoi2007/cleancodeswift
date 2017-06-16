//
//  ProfileSettingsInteractor.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol ProfileSettingsInteractorInput: ProfileSettingsViewControllerOutput {

}

protocol ProfileSettingsInteractorOutput {

    func presentSomething()
}

final class ProfileSettingsInteractor {

    let output: ProfileSettingsInteractorOutput
    let worker: ProfileSettingsWorker


    // MARK: - Initializers

    init(output: ProfileSettingsInteractorOutput, worker: ProfileSettingsWorker = ProfileSettingsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - ProfileSettingsInteractorInput

extension ProfileSettingsInteractor: ProfileSettingsViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
