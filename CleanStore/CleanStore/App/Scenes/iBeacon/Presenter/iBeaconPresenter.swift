//
//  iBeaconPresenter.swift
//  CleanStore
//
//  Created by hoi on 29/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol iBeaconPresenterInput: iBeaconInteractorOutput {

}

protocol iBeaconPresenterOutput: class {

    func displaySomething(viewModel: iBeaconViewModel)
}

final class iBeaconPresenter {

    private(set) weak var output: iBeaconPresenterOutput!


    // MARK: - Initializers

    init(output: iBeaconPresenterOutput) {

        self.output = output
    }
}


// MARK: - iBeaconPresenterInput

extension iBeaconPresenter: iBeaconPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = iBeaconViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
