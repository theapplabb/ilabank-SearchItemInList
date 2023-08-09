//
//  ImageItemListCollectionViewCell.swift
//  TableViewDemo
//
//  Created by Sandeep on 20/07/23.
//

import Foundation
import UIKit

class ImageItemListCollectionViewCell : UICollectionViewCell {
    static let cellIdentifier = "ImageItemListCollectionViewCell"
    
    // MARK: MAIN -
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpConstrains()
    }
    
    func configure(){
        addSubview(imageView)
        addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellData : ImageItem? {
        didSet {
            guard let cellData = cellData else {return}
            self.imageView.image = UIImage(named: cellData.image)
            self.title.text = cellData.title
        }
    }
    
    //MARK: Prop
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        return img
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        title.textColor = .label
        return title
    }()

    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            title.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        ])
    }
}
