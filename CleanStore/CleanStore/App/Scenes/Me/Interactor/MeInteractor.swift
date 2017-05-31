//
//  MeInteractor.swift
//  CleanStore
//
//  Created by hoi on 30/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MeInteractorInput: MeViewControllerOutput {
    
}

protocol MeInteractorOutput {
}

final class MeInteractor {

    let output: MeInteractorOutput
    let worker: MeWorker
    
    var promotionList: [Promotion]?


    // MARK: - Initializers

    init(output: MeInteractorOutput, worker: MeWorker = MeWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - MeInteractorInput

extension MeInteractor: MeViewControllerOutput {

    // MARK: - Business logic
    func fetchPromotions(request: MeViewModel.FetchPromotion.Request) {
        
    }

}
