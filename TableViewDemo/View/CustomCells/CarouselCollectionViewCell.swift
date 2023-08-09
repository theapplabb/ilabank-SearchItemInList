//
//  CarouselCollectionViewCell.swift
//  TableViewDemo
//
//  Created by Sandeep on 20/07/23.
//

import Foundation
import UIKit

class CarouselCollectionViewCell : UICollectionViewCell {
    
    static let cellIdentifier = "CarouselCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configure(){
        contentView.backgroundColor = .clear
        addSubview(shadowView)
        shadowView.addSubview(bannerImage)
        shadowView.setUp(to: self)
        bannerImage.setUp(to: shadowView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellData : ImageItem? {
        didSet {
            guard let cellData = cellData else {return}
            let resizedImage = resizeImage(image: UIImage(named: cellData.image)!, targetSize: CGSize(width: 200, height: 100))
            bannerImage.image = resizedImage
        }
    }
    let bannerImage : UIImageView = {
        let bannerImage = UIImageView()
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        bannerImage.backgroundColor = .systemBackground
        bannerImage.clipsToBounds = true
        bannerImage.contentMode = .scaleToFill
        bannerImage.layer.cornerRadius = 8
        return bannerImage
    }()
    
    lazy var shadowView: UIView = {
        let shadowView = UIView()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.backgroundColor = .clear
        shadowView.layer.cornerRadius = 8
        shadowView.layer.borderWidth = 0.3
        shadowView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        shadowView.layer.shadowColor = UIColor.label.withAlphaComponent(0.4).cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowRadius = 3
        return shadowView
    }()
    
}
