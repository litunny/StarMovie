//
//  MovieCell.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {

    var item : Movie? {
        willSet {
            iconImageView.sd_setImage(with: URL(string: newValue!.poster))
            titleView.text = newValue?.title
            subTitleView.text = "IMDB - " + newValue!.imdbID + " - " + newValue!.year
        }
        
        didSet {
            updateUI()
        }
    }

    private lazy var iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        return imageView
    }()

    private lazy var starImageView1: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemSymbol: .starFill))
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        return imageView
    }()

    private lazy var starImageView2: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemSymbol: .starFill))
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        return imageView
    }()

    private lazy var starImageView3: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemSymbol: .starFill))
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        return imageView
    }()

    private lazy var starImageView4: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemSymbol: .starFill))
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        return imageView
    }()

    private lazy var starImageView5: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemSymbol: .starFill))
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        return imageView
    }()

    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()

    private lazy var subTitleView: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .systemGray2
        return label
    }()

    private lazy var ratingView: UIStackView = {
        let rate = [starImageView1,
                    starImageView2,
                    starImageView3,
                    starImageView4,
                    starImageView5]

        let stackView = UIStackView(arrangedSubviews: rate)
        stackView.axis = .horizontal
        stackView.spacing = Dimensions.one
        stackView.distribution = .equalSpacing
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .white
        contentView.addSubview([iconImageView, ratingView, titleView, subTitleView])

        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: Dimensions.twoFifty),

            ratingView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 12),
            ratingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ratingView.widthAnchor.constraint(equalToConstant: 90),

            titleView.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 7),
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleView.widthAnchor.constraint(equalToConstant: 130),

            subTitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 4),
            subTitleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subTitleView.widthAnchor.constraint(equalToConstant: 130),
        ])
    }

    func updateUI(){
        iconImageView.contentMode = .scaleToFill
        iconImageView.clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

