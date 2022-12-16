//
//  MainImageView.swift
//  WomanMarket
//
//  Created by Anuar Orazbekov on 08.12.2022.
//

import Foundation
import UIKit


class MainImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
