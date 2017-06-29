//
//  TouchMoviePresenter.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchMoviePresenterInput: TouchMovieInteractorOutput {

}

protocol TouchMoviePresenterOutput: class {

    func displaySomething(viewModel: TouchMovieViewModel)
}

final class TouchMoviePresenter {

    private(set) weak var output: TouchMoviePresenterOutput!


    // MARK: - Initializers

    init(output: TouchMoviePresenterOutput) {

        self.output = output
    }
}


// MARK: - TouchMoviePresenterInput

extension TouchMoviePresenter: TouchMoviePresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = TouchMovieViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
