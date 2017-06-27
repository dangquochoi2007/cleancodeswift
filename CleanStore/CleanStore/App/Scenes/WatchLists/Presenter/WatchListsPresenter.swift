//
//  WatchListsPresenter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol WatchListsPresenterInput: WatchListsInteractorOutput {

}

protocol WatchListsPresenterOutput: class {

    func displaySomething(viewModel: WatchListsViewModel)
}

final class WatchListsPresenter {

    private(set) weak var output: WatchListsPresenterOutput!


    // MARK: - Initializers

    init(output: WatchListsPresenterOutput) {

        self.output = output
    }
}


// MARK: - WatchListsPresenterInput

extension WatchListsPresenter: WatchListsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = WatchListsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
