//
//  WatchListsViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit
import AVFoundation

protocol WatchListsViewControllerInput: WatchListsPresenterOutput {

}

protocol WatchListsViewControllerOutput {

    func doSomething()
}

final class WatchListsViewController: UIViewController {

    var output: WatchListsViewControllerOutput!
    var router: WatchListsRouterProtocol!
    
    var watchListsBackgroundColor: UIColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 0.95)
    var watchListsForegroundColor: UIColor = UIColor(red: 24.0/255.0, green: 235.0/255.0, blue: 188.0/255.0, alpha: 1)
    
    var moviesList: [String] = ["Movie_#1", "Movie_#2", "Movie_#3", "Movie_#4", "Movie_#5", "Movie_#6"]
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    lazy var watchListsCollectionView: UICollectionView = { [unowned self] in
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.movieCollectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WatchListMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "WatchListMoviesCollectionViewCell")
        collectionView.register(WatchListTVShowsCollectionViewCellCollectionViewCell.nib, forCellWithReuseIdentifier: WatchListTVShowsCollectionViewCellCollectionViewCell.nibName)
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.addSubview(self.segmentControl)
        return collectionView
    }()
    
    
    lazy var movieCollectionViewLayout: PinterestLayout = { [unowned self] in
        let layout = PinterestLayout()
        
        layout.delegate = self
        return layout
    }()
    
    lazy var tvShowCollectionViewLayout: UICollectionViewLayout = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets.zero
        
        return layout
    }()
    
    lazy var segmentControl: TZSegmentedControl = { [unowned self] in
        let titleCont = TZSegmentedControl(sectionTitles: ["MOVIES", "TV SHOWS"])
        titleCont.frame = CGRect(x: (self.view.frame.width/2 - 50), y: -50, width: self.view.frame.width, height: 50)
//        titleCont.type = TZSegmentedControlType.textImages
        titleCont.indicatorWidthPercent = 1.5
        titleCont.backgroundColor = self.watchListsBackgroundColor
        titleCont.borderType = .none
        titleCont.borderColor = self.watchListsBackgroundColor
        titleCont.borderWidth = 2.0
        titleCont.segmentWidthStyle = .dynamic
        titleCont.verticalDividerEnabled = false
        titleCont.verticalDividerWidth = 0
        titleCont.verticalDividerColor = self.watchListsBackgroundColor
        titleCont.selectionStyle = .fullWidth
        titleCont.selectionIndicatorLocation = .down
        titleCont.selectionIndicatorColor = self.watchListsForegroundColor
        titleCont.selectionIndicatorHeight = 4.0
        titleCont.edgeInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        titleCont.selectedTitleTextAttributes = [NSForegroundColorAttributeName: self.watchListsForegroundColor]
        titleCont.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,
                                         NSFontAttributeName:UIFont(name: "Lato-Bold", size: 11.0) ?? UIFont.systemFont(ofSize: 11)]
        return titleCont
        }()
    
    
    

    // MARK: - Initializers

    init(configurator: WatchListsConfigurator = WatchListsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: WatchListsConfigurator = WatchListsConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        configureControllerWhenLoad()
        configureRightMenuBarButton()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureControllerWhenAppear()
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
        //recalculate the collection view layout when the view layout changes
        watchListsCollectionView.collectionViewLayout.invalidateLayout()
    }

    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
    
    func configureControllerWhenLoad() {
        
        constraintsLayoutCollectionView()
    }
    
    func configureControllerWhenAppear() {
        navigationController?.navigationBar.barTintColor = watchListsBackgroundColor
        navigationController?.navigationBar.tintColor = watchListsForegroundColor
        navigationController?.navigationBar.isTranslucent = false
        
        tabBarController?.tabBar.barTintColor = watchListsBackgroundColor
        tabBarController?.tabBar.tintColor = watchListsForegroundColor
        
        title = "WATCHLIST"
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName : UIFont(name: "Lato-Bold", size: 15) ?? UIFont.systemFont(ofSize: 15),
            NSForegroundColorAttributeName: watchListsForegroundColor
        ]
    }
    
    func configureRightMenuBarButton() {
        let mainMenuImage = UIImage(named: "artboard_ico")
        let mainMenuBarButton = UIBarButtonItem(image: mainMenuImage, style: .plain, target: self, action: #selector(MainMenuTapped))
        
        //optionButton.action = something (put your action here)
        self.navigationItem.leftBarButtonItem = mainMenuBarButton
    }
    
    
    func MainMenuTapped(sender: UIButton) {
        
    }
}


// MARK: - WatchListsPresenterOutput

extension WatchListsViewController: WatchListsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: WatchListsViewModel) {

        // TODO: Update UI
    }
}

extension WatchListsViewController: UICollectionViewDelegate, UICollectionViewDataSource, PinterestLayoutDelegate {
    
    
    func constraintsLayoutCollectionView() {
        
        [watchListsCollectionView].forEach {
            self.view.addSubview($0)
        }
        
        let attributes:[NSLayoutAttribute] = [.top, .left, .bottom, .right]
        for attribute in attributes {
            view.addConstraint(NSLayoutConstraint(item: self.watchListsCollectionView, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0))
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchListMoviesCollectionViewCell", for: indexPath) as! WatchListMoviesCollectionViewCell
        cell.moviesImageView.image = UIImage(named: moviesList[indexPath.row])
        return cell
    }
    
    func getNumberOfColumn() -> Int {
        return Int(self.watchListsCollectionView.frame.width/160.0)
    }
    
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath) -> CGFloat
    {
        let itemsPerRow = getNumberOfColumn()
        
        let paddingSpace = self.sectionInsets.left * CGFloat(itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        let boundingRect =  CGRect(x: 0, y: 0, width: widthPerItem, height: CGFloat.greatestFiniteMagnitude);
        let rect = AVMakeRect(aspectRatio: (UIImage(named: moviesList[indexPath.item])?.size)!, insideRect: boundingRect);
        return rect.height
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        router.navigateTouchMovieViewController()
    }
}
