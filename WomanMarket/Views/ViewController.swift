//
//  ViewController.swift
//  WomanMarket
//
//  Created by Anuar Orazbekov on 08.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
//    let data = [
//        BannerData(image: <#T##UIImage#>, title: <#T##String#>, decription: <#T##String#>, price: <#T##String#>)
//    ]

    private let menuCollectionView = CategoryCollectionView()
    private let bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
    }

    private func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(menuCollectionView)
        view.addSubview(bannerCollectionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            menuCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            menuCollectionView.heightAnchor.constraint(equalToConstant: 40),
            
            bannerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bannerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            bannerCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            bannerCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            bannerCollectionView.heightAnchor.constraint(equalTo: bannerCollectionView.widthAnchor, multiplier: 0.5)
        ])
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BannerCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
    
    
}

