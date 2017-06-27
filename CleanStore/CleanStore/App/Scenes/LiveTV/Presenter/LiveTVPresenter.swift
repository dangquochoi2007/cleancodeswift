//
//  LiveTVPresenter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol LiveTVPresenterInput: LiveTVInteractorOutput {

}

protocol LiveTVPresenterOutput: class {

    func displaySomething(viewModel: LiveTVViewModel)
}

final class LiveTVPresenter {

    private(set) weak var output: LiveTVPresenterOutput!


    // MARK: - Initializers

    init(output: LiveTVPresenterOutput) {

        self.output = output
    }
}


// MARK: - LiveTVPresenterInput

extension LiveTVPresenter: LiveTVPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = LiveTVViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
