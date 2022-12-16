//
//  CategoryCollectionView.swift
//  WomanMarket
//
//  Created by Anuar Orazbekov on 08.12.2022.
//

import Foundation
import UIKit

class CategoryCollectionView: UICollectionView {
    
    private let categoryLayout = UICollectionViewFlowLayout()
    private let nameCategory = ["Feature", "Woman", "Men", "Kids", "Vintage", "Sport", "Modern", "Casual", "Old", "Home"]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
       
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        categoryLayout.minimumLineSpacing = 5
        categoryLayout.scrollDirection = .horizontal
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        bounces = false
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        register(CategoryMenuViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension CategoryCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameCategory.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategoryMenuViewCell else { return UICollectionViewCell() }
        cell.nameCategoryLabel.text = nameCategory[indexPath.item]
        
    
        return cell
    }
    
}

extension CategoryCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryFont = UIFont(name: "systemFont", size: 17)
        let categoryAtributes = [NSAttributedString.Key.font: categoryFont as Any]
        let categoryWidth = nameCategory[indexPath.item].size(withAttributes: categoryAtributes).width + 20
        
        return CGSize(width: categoryWidth, height: collectionView.frame.height)
    }
}
