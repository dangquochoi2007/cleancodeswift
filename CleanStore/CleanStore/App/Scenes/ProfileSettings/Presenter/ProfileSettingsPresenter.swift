//
//  ProfileSettingsPresenter.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol ProfileSettingsPresenterInput: ProfileSettingsInteractorOutput {

}

protocol ProfileSettingsPresenterOutput: class {

    func displaySomething(viewModel: ProfileSettingsViewModel)
}

final class ProfileSettingsPresenter {

    private(set) weak var output: ProfileSettingsPresenterOutput!


    // MARK: - Initializers

    init(output: ProfileSettingsPresenterOutput) {

        self.output = output
    }
}


// MARK: - ProfileSettingsPresenterInput

extension ProfileSettingsPresenter: ProfileSettingsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = ProfileSettingsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
