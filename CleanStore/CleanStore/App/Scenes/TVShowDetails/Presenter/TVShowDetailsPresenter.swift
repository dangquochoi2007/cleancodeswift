//
//  TVShowDetailsPresenter.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowDetailsPresenterInput: TVShowDetailsInteractorOutput {

}

protocol TVShowDetailsPresenterOutput: class {

    func displaySomething(viewModel: TVShowDetailsViewModel)
}

final class TVShowDetailsPresenter {

    private(set) weak var output: TVShowDetailsPresenterOutput!


    // MARK: - Initializers

    init(output: TVShowDetailsPresenterOutput) {

        self.output = output
    }
}


// MARK: - TVShowDetailsPresenterInput

extension TVShowDetailsPresenter: TVShowDetailsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = TVShowDetailsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
