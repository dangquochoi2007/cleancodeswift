//
//  MoviesViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

//#https://www.raywenderlich.com/107439/uicollectionview-custom-layout-tutorial-pinterest
//#http://blog.rinatkhanov.me/ios/transitions.html
//#https://github.com/John-Lluch/SWRevealViewController/issues/289

protocol MoviesViewControllerInput: MoviesPresenterOutput {

}

protocol MoviesViewControllerOutput {

    func doSomething()
}

final class MoviesViewController: UIViewController {

    var output: MoviesViewControllerOutput!
    var router: MoviesRouterProtocol!
    
    var moviesBackgroundColor: UIColor = UIColor(red: 22.0/255.0, green: 23.0/255.0, blue: 27.0/255.0, alpha: 0.95)
    var moviesForegroundColor: UIColor = UIColor(red: 239.0/255.0, green: 26.0/255.0, blue: 81.0/255.0, alpha: 1)

    lazy var moviesCollectionView: UICollectionView =  { [unowned self] in
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "MoviesCollectionViewCell")
        collectionView.backgroundColor = self.moviesBackgroundColor
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.addSubview(self.segmentControl)
        return collectionView
    }()
    
    
    lazy var collectionViewLayout: UICollectionViewLayout = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets.zero

        return layout
    }()
    
    lazy var segmentControl: TZSegmentedControl = { [unowned self] in
        let titleCont = TZSegmentedControl(sectionTitles: ["", "FOR YOU", "TOP","ACTION", "COMEDY", "FAMILY" , "ENGLISH", "VIDEO EPIC"])
        titleCont.frame = CGRect(x: 0, y: -50, width: self.view.frame.width, height: 50)
        titleCont.indicatorWidthPercent = 1.5
        titleCont.backgroundColor = self.moviesBackgroundColor
        titleCont.borderType = .none
        titleCont.borderColor = self.moviesBackgroundColor
        titleCont.borderWidth = 2.0
        titleCont.segmentWidthStyle = .dynamic
        titleCont.verticalDividerEnabled = false
        titleCont.verticalDividerWidth = 0
        titleCont.verticalDividerColor = self.moviesBackgroundColor
        titleCont.selectionStyle = .fullWidth
        titleCont.selectionIndicatorLocation = .down
        titleCont.selectionIndicatorColor = self.moviesForegroundColor
        titleCont.selectionIndicatorHeight = 4.0
        titleCont.edgeInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        titleCont.selectedTitleTextAttributes = [NSForegroundColorAttributeName: self.moviesForegroundColor]
        titleCont.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,
                                         NSFontAttributeName:UIFont(name: "Lato-Bold", size: 11.0) ?? UIFont.systemFont(ofSize: 11)]
        return titleCont
        }()

    // MARK: - Initializers

    init(configurator: MoviesConfigurator = MoviesConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: MoviesConfigurator = MoviesConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        title = "MOVIES"
        configureControllerWhenLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureControllerWhenAppear()
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
        //recalculate the collection view layout when the view layout changes
        moviesCollectionView.collectionViewLayout.invalidateLayout()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
    
    func configureControllerWhenLoad() {
        
        constraintsLayoutCollectionView()
        configureRightMenuBarButton()
    }
    
    
    func configureControllerWhenAppear() {
        navigationController?.navigationBar.barTintColor = moviesBackgroundColor
        navigationController?.navigationBar.tintColor = moviesForegroundColor
        navigationController?.navigationBar.isTranslucent = false
        
        tabBarController?.tabBar.barTintColor = moviesBackgroundColor
        tabBarController?.tabBar.tintColor = moviesForegroundColor
        
        title = "MOVIES"
        
        guard let latoBoldFont = UIFont(name: "Lato-Bold", size: 15) else {
            return
        }
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName : latoBoldFont,
            NSForegroundColorAttributeName: moviesForegroundColor
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


// MARK: - MoviesPresenterOutput

extension MoviesViewController: MoviesViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: MoviesViewModel) {

        // TODO: Update UI
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func constraintsLayoutCollectionView() {
        
        [moviesCollectionView].forEach {
            self.view.addSubview($0)
        }
        
        let attributes: [NSLayoutAttribute] = [.top, .left, .bottom, .right]
        
        for attribute in attributes {
            view.addConstraint(NSLayoutConstraint(item: self.moviesCollectionView, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1, constant: 0))
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MoviesCollectionViewCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //265 × 376
        let totalwidth = collectionView.bounds.size.width;
        let numberOfCellsPerRow: Int = Int(totalwidth/160.0)
        let width: CGFloat = CGFloat(Int(totalwidth)/numberOfCellsPerRow)
        let height: CGFloat = CGFloat(width)*376.0/256.0
        
        return CGSize(width: width, height: height)
    }
}
