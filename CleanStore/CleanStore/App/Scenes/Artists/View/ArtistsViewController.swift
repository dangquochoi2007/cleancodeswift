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
    func fetchArtists(request: ArtistsViewModel.FetchArtists.Request)
   
}

final class ArtistsViewController: UIViewController, ErrorPresenter {
    
    var output: ArtistsViewControllerOutput!
    var router: ArtistsRouterProtocol!
    
    let artistsView = ArtistsView()
    
    fileprivate var artistsViewModels: [ArtistsViewModel.FetchArtists.ViewModel.DisplayedArtist] = []
    
    
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
        
        
        setupTitle()
        setupTableView()
        fetchArtists()
    }
    
    
    // MARK: - Setup
    private func setupTitle() {
        title = Strings.Artists.screenTitle
    }
    
    
    
    private func setupTableView() {
        
        artistsView.tableView.delegate = self
        artistsView.tableView.dataSource = self
        artistsView.tableView.register(ArtistTableViewCell.self, forCellReuseIdentifier: ArtistTableViewCell.reuseIdentifier())
        artistsView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    
    func fetchArtists() {
        
        let request = ArtistsViewModel.FetchArtists.Request()
        output.fetchArtists(request: request)
    }
    
    
    func refresh() {
        
        fetchArtists()
    }
}


// MARK: - UITableViewDataSource
extension ArtistsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return artistsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.reuseIdentifier(), for: indexPath) as? ArtistTableViewCell else {
            
            assert(false, "Invalid table view cell, Did you forgot to register ArtistsTableViewCell")
            return UITableViewCell()
        }
        
        
        let viewModel = artistsViewModels[indexPath.row]
        cell.viewModel = viewModel
        return cell
    }
}


extension ArtistsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - ArtistsPresenterOutput

extension ArtistsViewController: ArtistsViewControllerInput {
    
    
    func displayArtists(viewModels: [ArtistsViewModel.FetchArtists.ViewModel.DisplayedArtist]) {
        
        artistsViewModels = viewModels
        artistsView.tableView.reloadData()
        artistsView.refreshControl.endRefreshing()
    }
    
    
    func displayError(viewModel: ErrorViewModel) {
        
        artistsView.refreshControl.endRefreshing()
        presentError(viewModel: viewModel)
    }
}
