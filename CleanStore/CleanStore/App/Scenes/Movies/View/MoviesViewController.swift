//
//  MoviesViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit
import AVFoundation

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
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
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
    
    
    lazy var collectionViewLayout: PinterestLayout = { [unowned self] in
        let layout = PinterestLayout()

        layout.delegate = self

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
        if self.revealViewController() != nil {
            let mainMenuImage = UIImage(named: "artboard_ico")
            let mainMenuBarButton = UIBarButtonItem(image: mainMenuImage, style: .plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
            self.navigationItem.leftBarButtonItem = mainMenuBarButton
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
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

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, PinterestLayoutDelegate {
    
    
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

    func getNumberOfColumn() -> Int {
       return Int(self.moviesCollectionView.frame.width/160.0)
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
}

protocol PinterestLayoutDelegate {
    //Method to ask the delegate for the height of the image
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath) -> CGFloat
    
    func getNumberOfColumn() -> Int
}



class PinterestLayout: UICollectionViewLayout {
    let attributeArray = NSMutableDictionary()
    var contentSize:CGSize!
    var delegate:PinterestLayoutDelegate!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepare()
    {
        super.prepare()
        self.attributeArray.removeAllObjects()
        let numberOfColumn : Int = self.delegate.getNumberOfColumn();
        let padding:CGFloat = 0.0;
        
        let collectionViewWidth = self.collectionView?.frame.size.width
        let itemWidth : CGFloat = (collectionViewWidth! - padding * CGFloat((numberOfColumn + 1))) / CGFloat(numberOfColumn)
        var contentHeight:CGFloat = 0.0;
        var columnArray = [CGFloat](repeating: 0.0, count: numberOfColumn);
        
        //Tính toán kích thước và vị trí của từng cell trong CollectionView
        for i in 0 ... (self.collectionView?.numberOfItems(inSection: 0))! - 1 {
            var tempX : CGFloat = 0.0
            var tempY : CGFloat = 0.0
            let indexPath = NSIndexPath(item: i, section: 0)
            let itemHeight:CGFloat = delegate.collectionView(collectionView: (self.collectionView)!, heightForPhotoAtIndexPath: indexPath)
            
            //Tìm cột có độ dài ngắn nhất trong CollectionView
            var minHeight:CGFloat = 0.0;
            var minIndex:Int = 0;
            
            if (numberOfColumn > 0){
                minHeight = columnArray[0]
                
            }
            for colIndex in 0..<numberOfColumn {
                if (minHeight > columnArray[colIndex]){
                    minHeight = columnArray[colIndex]
                    minIndex = colIndex
                }
            }
            
            //Bổ sung  cell mới vào cột có kích thước ngắn nhất
            tempX = padding + (itemWidth + padding) *  CGFloat(minIndex);
            tempY = minHeight + padding;
            columnArray[minIndex] = tempY + itemHeight;
            let attributes = UICollectionViewLayoutAttributes(forCellWith:indexPath as IndexPath);
            attributes.frame = CGRect(x: tempX, y: tempY, width: itemWidth, height: itemHeight);
            self.attributeArray.setObject(attributes, forKey: indexPath)
            
            //Tính toán lại chiều cao Content Size của CollectionView
            let newContentHeight:CGFloat = tempY + padding + itemHeight + padding;
            if (newContentHeight > contentHeight){
                contentHeight = newContentHeight;
            }
        }
        
        self.contentSize = CGSize(width: (self.collectionView?.frame.size.width)!, height: contentHeight);
    }
    
    override var collectionViewContentSize: CGSize
    {
        return self.contentSize
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Duyệt các đối tượng trong attributeArray để tìm ra các cell nằm trong khung nhìn rect
        for attributes  in self.attributeArray {
            if (attributes.value as! UICollectionViewLayoutAttributes).frame.intersects(rect ) {
                layoutAttributes.append((attributes.value as! UICollectionViewLayoutAttributes))
            }
        }
        return layoutAttributes
    }
}



