//
//  CollectionDemoLayout.swift
//  demo
//
//  Created by Claudia Cavalini Maganhi on 20/01/21.
//  Copyright © 2021 Claudia Maganhi. All rights reserved.
//

import UIKit

class CollectionDemoLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
      super.prepare()
      guard let collectionWidth = collectionView?.frame.width else { return }
      let widthSizing = (collectionWidth - 40) / 4
      scrollDirection = .vertical
      itemSize = CGSize(width: widthSizing, height: widthSizing)
      minimumLineSpacing = 8
      minimumInteritemSpacing = 8
      sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}

