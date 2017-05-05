//
//  ArtistsPresenter.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol ArtistsPresenterInput: ArtistsInteractorOutput {

}

protocol ArtistsPresenterOutput: class {

    func displaySomething(viewModel: ArtistsViewModel)
}

final class ArtistsPresenter {

    private(set) weak var output: ArtistsPresenterOutput!


    // MARK: - Initializers

    init(output: ArtistsPresenterOutput) {

        self.output = output
    }
}


// MARK: - ArtistsPresenterInput

extension ArtistsPresenter: ArtistsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = ArtistsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
