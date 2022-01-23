//
//  MovieCell.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class MovieCell: UICollectionViewCell {

    var item : Movie? {
        willSet {
            iconImageView.image = newValue?.image
            iconImageView.contentMode = .scaleAspectFit
            title.text = newValue?.title
        }
    }

    private var iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var title : UILabel = {
        let titleView = UILabel()
        titleView.textColor = .gray
        titleView.font = .systemFont(ofSize: Dimensions.eight)
        return titleView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .white
        contentView.addSubview([iconImageView])

        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 250),

            //title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            //title.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

