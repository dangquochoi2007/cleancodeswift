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
    
    
    var moviesList: [String] = ["Movie_#1", "Movie_#2", "Movie_#3", "Movie_#4", "Movie_#5", "Movie_#6"]
    
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
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MoviesCollectionViewCell
        cell.moviesImageView.image = UIImage(named: moviesList[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router.navigateTouchMovieViewController()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //265 × 376
        guard let image = UIImage(named: moviesList[indexPath.row]) else {
            return CGSize.zero
        }
        
        let ratio = CGFloat(image.size.height/image.size.width)
        
        
        let totalwidth = collectionView.bounds.size.width;
        let numberOfCellsPerRow: Int = Int(totalwidth/160.0)
        let width: CGFloat = CGFloat(Int(totalwidth)/numberOfCellsPerRow)
        let height: CGFloat = CGFloat(width)*ratio
        print("ratio \(ratio) : \(width) : \(height)")
        return CGSize(width: width, height: height)
    }
}

protocol PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForPhotoAtIndexPath
        indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath
        indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
    
}

class PinterestLayoutAttributes: UICollectionViewLayoutAttributes {
    var photoHeight: CGFloat = 0
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = super.copyWithZone(zone) as! PinterestLayoutAttributes
        copy.photoHeight = photoHeight
        return copy
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let attributes = object as? PinterestLayoutAttributes {
            if attributes.photoHeight == photoHeight {
                return super.isEqual(object)
            }
        }
        return false
    }
    
}

class PinterestLayout: UICollectionViewLayout {
    var delegate: PinterestLayoutDelegate!
    var numberOfColumns = 1
    var cellPadding: CGFloat = 0
    
    private var cache = [PinterestLayoutAttributes]()
    private var contentHeight: CGFloat = 0
    private var width: CGFloat {
        get {
            let inset = collectionView!.contentInset
            return CGRectGetWidth(collectionView!.bounds) - (inset.left + inset.right)
        }
    }
    
    override class func layoutAttributesClass() -> AnyClass {
        return PinterestLayoutAttributes.self
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSize(width: width, height: contentHeight)
    }
    
    override func prepareLayout() {
        if cache.isEmpty {
            let columnWidth = width / CGFloat(numberOfColumns)
            var xOffsets = [CGFloat]()
            for column in 0..<numberOfColumns {
                xOffsets.append(CGFloat(column) * columnWidth)
            }
            
            var yOffsets = [CGFloat](count: numberOfColumns, repeatedValue: 0)
            
            var currentColumn = 0
            for item in 0..<collectionView!.numberOfItemsInSection(0) {
                let indexPath = NSIndexPath(forItem: item, inSection: 0)
                let width = columnWidth - (cellPadding * 2)
                let photoHeight = delegate.collectionView(collectionView!, heightForPhotoAtIndexPath: indexPath, withWidth: width)
                let annotationHeight = delegate.collectionView(collectionView!, heightForAnnotationAtIndexPath: indexPath, withWidth: width)
                let height = cellPadding + photoHeight + annotationHeight + cellPadding
                
                //                let height = delegate.collectionView(collectionView!, heightForItemAtIndexPath: indexPath)
                let frame = CGRect(x: xOffsets[currentColumn], y: yOffsets[currentColumn], width: columnWidth, height: height)
                let insetFrame = CGRectInset(frame, cellPadding, cellPadding)
                
                let attributes = PinterestLayoutAttributes(forCellWithIndexPath: indexPath)
                attributes.frame = insetFrame
                attributes.photoHeight = photoHeight
                cache.append(attributes)
                contentHeight = max(contentHeight, CGRectGetMaxY(frame))
                yOffsets[currentColumn] = yOffsets[currentColumn] + height
                currentColumn = currentColumn >= (numberOfColumns - 1) ? 0 : ++currentColumn
            }
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attribute in cache {
            if CGRectIntersectsRect(attribute.frame, rect) {
                layoutAttributes.append(attribute)
            }
        }
        
        return layoutAttributes
    }
}
