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

    
    // MARK: - ArtistsInteractorOutput
    
    /// _ArtistsInteractorOutput_ is a protocol for interactor output behaviours
    func presentArtists(artists: [Artist])
    
    /// Tells the output to present an error
    ///
    /// - parameter error: The error to present
    func presentError(error: Error)
}

final class ArtistsInteractor {

    let output: ArtistsInteractorOutput
    let worker: ArtistsWorker

    var artists: [Artist]?

    // MARK: - Initializers

    init(output: ArtistsInteractorOutput, worker: ArtistsWorker = ArtistsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - ArtistsInteractorInput

extension ArtistsInteractor: ArtistsViewControllerOutput {


    /// Fetches a list of top artists through the worker
    func fetchArtists(request: ArtistsViewModel.FetchArtists.Request) {
        worker.fetchArtists(request: request) { [weak self] artists, error in
            
            if let strongSelf = self {
                
                if let artistsError = error {
                    
                    strongSelf.output.presentError(error: artistsError)
                } else if let artistsArray = artists {
                    
                    strongSelf.artists = artistsArray
                    strongSelf.output.presentArtists(artists: artistsArray)
                }
            }
        }
    }

   
}
