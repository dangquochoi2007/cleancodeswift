//
//  ArtistsViewController.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol ArtistsViewControllerInput: ArtistsPresenterOutput {
    
}

protocol ArtistsViewControllerOutput {
    
    var artists: [Artist]? { get }
    func fetchArtists()
   
}

final class ArtistsViewController: UIViewController, ErrorPresenter {
    
    var output: ArtistsViewControllerOutput!
    var router: ArtistsRouterProtocol!
    
    let artistsView = ArtistsView()
    
    fileprivate var artistsViewModels: [ArtistsViewModel] = []
    
    
    // MARK: - Initializers
    
    /// Initializes an instance of _ArtistsViewController_ with a configurator
    ///
    /// - parameter configurator: The configurator
    ///
    /// - returns: The instance of _ArtistsViewController_
    init(configurator: ArtistsConfigurator = ArtistsConfigurator.sharedInstance) {
        
        super.init(nibName: nil, bundle: nil)
        
        configure()
    }
    
    /// Initializes an instance of _ArtistsViewController_ from storyboard
    ///
    /// - parameter coder: The coder
    ///
    /// - returns: The instance of _ArtistsViewController_
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    
    
    // MARK: - Configurator
    
    private func configure(configurator: ArtistsConfigurator = ArtistsConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    
    
    
    // MARK: - View lifecycle
    
    override func loadView() {
        view = artistsView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    
    // MARK: - Setup
    private func setupTitle() {
        title = String.ar
    }
    
  
    
    
    // MARK: - UITableViewDelegate
    
    // MARK: - UITableViewDataSource
    
    // MARK: - UITable
    
}


// MARK: - ArtistsPresenterOutput

extension ArtistsViewController: ArtistsViewControllerInput {
    
    
    // MARK: - Display logic
    
    func displaySomething(viewModel: ArtistsViewModel) {
        
        // TODO: Update UI
    }
}
