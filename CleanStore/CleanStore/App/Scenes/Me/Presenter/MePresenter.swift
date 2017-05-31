//
//  MePresenter.swift
//  CleanStore
//
//  Created by hoi on 30/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MePresenterInput: MeInteractorOutput {

}

protocol MePresenterOutput: class {

    func displaySomething(viewModel: MeViewModel)
}

final class MePresenter {

    private(set) weak var output: MePresenterOutput!


    // MARK: - Initializers

    init(output: MePresenterOutput) {

        self.output = output
    }
}


// MARK: - MePresenterInput

extension MePresenter: MePresenterInput {


    // MARK: - Presentation logic
}
