//
//  BannerTableViewCell.swift
//  WomanMarket
//
//  Created by Anuar Orazbekov on 16.12.2022.
//

import Foundation
import SnapKit
import UIKit

final class BannerCollectionViewCell: UICollectionViewCell {
    
    private let bgImage = UIImageView()
    private let titleUILabel = UILabel()
    private let dicriptionUILabel = UILabel()
    private let priceUILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        bgImage.image = UIImage(named: "FirstWoman")
        
        titleUILabel.text = "sdsada"
        titleUILabel.textColor = .white
        titleUILabel.font = titleUILabel.font.withSize(30)
        titleUILabel.numberOfLines = 0
        
        dicriptionUILabel.text = "dfdsfsff"
        dicriptionUILabel.textColor = .white
        dicriptionUILabel.font = dicriptionUILabel.font.withSize(15)
        dicriptionUILabel.numberOfLines = 0
        
        priceUILabel.text = "$1,999"
        priceUILabel.font = priceUILabel.font.withSize(35)
        priceUILabel.numberOfLines = 0
        
    }
    
    private func setSubviews() {
        contentView.addSubview(bgImage)
        bgImage.addSubview(titleUILabel)
        bgImage.addSubview(dicriptionUILabel)
        bgImage.addSubview(priceUILabel)
    }
    
    private func setConstraints() {
        bgImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleUILabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        dicriptionUILabel.snp.makeConstraints {
            $0.top.equalTo(titleUILabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(10)
        }
        priceUILabel.snp.makeConstraints {
            $0.top.equalTo(dicriptionUILabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(10)
        }
    }
}
