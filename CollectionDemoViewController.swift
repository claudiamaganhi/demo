//
//  CollectionDemoViewController.swift
//  demo
//
//  Created by Claudia Cavalini Maganhi on 20/01/21.
//  Copyright © 2021 Claudia Maganhi. All rights reserved.
//

import UIKit

class CollectionDemoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionDemoLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        var constraints: [NSLayoutConstraint] = []
        constraints.append(collectionView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }
}
