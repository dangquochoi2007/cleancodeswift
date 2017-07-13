//
//  MoviesDetailsFooterView.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

class MoviesDetailsFooterView: UIView {
    
    
    
    
    @IBOutlet weak var recommandCollectionView: UICollectionView!

    lazy var moviesLikeAlsoList: [String] = ["Movie_#5","Movie_#4", "Movie_#2"] 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureViewWhenAwake()
    }
    
    func configureViewWhenAwake() {
        recommandCollectionView.showsHorizontalScrollIndicator = false
        recommandCollectionView.showsVerticalScrollIndicator = false
        recommandCollectionView.delegate = self
        recommandCollectionView.dataSource = self
        recommandCollectionView.register(RecommandationsCollectionViewCell.nib, forCellWithReuseIdentifier: RecommandationsCollectionViewCell.nibName)
    }

}

extension MoviesDetailsFooterView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesLikeAlsoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandationsCollectionViewCell.nibName, for: indexPath) as! RecommandationsCollectionViewCell
        
        cell.movieCoverImageView.image = UIImage(named: moviesLikeAlsoList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    
        return CGSize(width: 138, height: collectionView.frame.size.height)
    }
    
}
