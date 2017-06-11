//
//  iBeaconReceivePresenter.swift
//  CleanStore
//
//  Created by QuocHoi on 9/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol iBeaconReceivePresenterInput: iBeaconReceiveInteractorOutput {

}

protocol iBeaconReceivePresenterOutput: class {

    func displaySomething(viewModel: iBeaconReceiveViewModel)
}

final class iBeaconReceivePresenter {

    private(set) weak var output: iBeaconReceivePresenterOutput!


    // MARK: - Initializers

    init(output: iBeaconReceivePresenterOutput) {

        self.output = output
    }
}


// MARK: - iBeaconReceivePresenterInput

extension iBeaconReceivePresenter: iBeaconReceivePresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = iBeaconReceiveViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
