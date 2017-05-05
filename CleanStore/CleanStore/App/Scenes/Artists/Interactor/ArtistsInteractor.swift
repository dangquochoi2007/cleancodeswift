//
//  ArtistsInteractor.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol ArtistsInteractorInput: ArtistsViewControllerOutput {

}

protocol ArtistsInteractorOutput {

    func presentSomething()
}

final class ArtistsInteractor {

    let output: ArtistsInteractorOutput
    let worker: ArtistsWorker


    // MARK: - Initializers

    init(output: ArtistsInteractorOutput, worker: ArtistsWorker = ArtistsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - ArtistsInteractorInput

extension ArtistsInteractor: ArtistsViewControllerOutput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
