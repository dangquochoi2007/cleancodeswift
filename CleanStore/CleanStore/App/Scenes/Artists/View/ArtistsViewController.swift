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
    
   
}

final class ArtistsViewController: UIViewController {
    var output: ArtistsViewControllerOutput!
    var router: ArtistsRouterProtocol!
    
    
    @IBOutlet weak var artistsTableView: UITableView!
    // MARK: - Initializers
    
    init(configurator: ArtistsConfigurator = ArtistsConfigurator.sharedInstance) {
        
        super.init(nibName: "ArtistsViewController", bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    
    
    // MARK: - Configurator
    
    private func configure(configurator: ArtistsConfigurator = ArtistsConfigurator.sharedInstance) {
        
        configurator.configure(viewController: self)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        doSomethingOnLoad()
    }
    
    
    // MARK: - Load data
    
    func doSomethingOnLoad() {
        
        // TODO: Ask the Interactor to do some work
        
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
