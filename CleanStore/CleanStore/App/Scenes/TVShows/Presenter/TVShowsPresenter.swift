//
//  TVShowsPresenter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowsPresenterInput: TVShowsInteractorOutput {

}

protocol TVShowsPresenterOutput: class {

    func displaySomething(viewModel: TVShowsViewModel)
}

final class TVShowsPresenter {

    private(set) weak var output: TVShowsPresenterOutput!


    // MARK: - Initializers

    init(output: TVShowsPresenterOutput) {

        self.output = output
    }
}


// MARK: - TVShowsPresenterInput

extension TVShowsPresenter: TVShowsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = TVShowsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
