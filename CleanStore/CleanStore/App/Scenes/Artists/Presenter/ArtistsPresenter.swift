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


// MARK: - ArtistsPresenterOutput

/// _ArtistsPresenterOutput_ is a protocol for presenter output behaviours
protocol ArtistsPresenterOutput: class {
    /// Tells the output to display artists
    ///
    /// - parameter viewModels: The artist view models
    func displayArtists(viewModels: [ArtistsViewModel.FetchArtists.ViewModel.DisplayedArtist])
    
    
    /// Tells the output to dislpay an error
    ///
    /// - parameter viewModel: The error view model
    func displayError(viewModel: ErrorViewModel)
}

final class ArtistsPresenter {

    private(set) weak var output: ArtistsPresenterOutput?


    // MARK: - Initializers

    init(output: ArtistsPresenterOutput) {

        self.output = output
    }
}


// MARK: - ArtistsPresenterInput

extension ArtistsPresenter: ArtistsPresenterInput {


    /// Prepares the artist models for presentation and tells the output to display artists
    ///
    /// - parameter artists: The list of artists
    func presentArtists(artists: [Artist]) {
        
        let viewModels = artists.flatMap { artist -> ArtistsViewModel.FetchArtists.ViewModel.DisplayedArtist in
            
            return ArtistsViewModel.FetchArtists.ViewModel.DisplayedArtist(title: artist.name, imageURL: artist.imageURL)
        }
        
        output?.displayArtists(viewModels: viewModels)
    }
    
    
    /// Prepares the error model for presentation and tells the output to display error
    ///
    /// - parameter error: The error
    func presentError(error: Error) {
        let errorViewModel = ErrorViewModel(title: Strings.Error.genericMessage, message: Strings.Error.genericMessage, buttonTitles: [Strings.Error.okButtonTitle])
        
        output?.displayError(viewModel: errorViewModel)
    }

    
}
