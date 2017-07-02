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

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandationsCollectionViewCell.nibName, for: indexPath)
        return cell
    }
    
    
}
