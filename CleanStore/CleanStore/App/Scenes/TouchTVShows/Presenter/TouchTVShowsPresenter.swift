//
//  TouchTVShowsPresenter.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchTVShowsPresenterInput: TouchTVShowsInteractorOutput {

}

protocol TouchTVShowsPresenterOutput: class {

    func displaySomething(viewModel: TouchTVShowsViewModel)
}

final class TouchTVShowsPresenter {

    private(set) weak var output: TouchTVShowsPresenterOutput!


    // MARK: - Initializers

    init(output: TouchTVShowsPresenterOutput) {

        self.output = output
    }
}


// MARK: - TouchTVShowsPresenterInput

extension TouchTVShowsPresenter: TouchTVShowsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = TouchTVShowsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
