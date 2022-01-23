//
//  Constraints.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class Constraints {

    static var shared: Constraints = {
        return Constraints()
    }()

    func home(view: UIView,
              headerSectionView: StarHeaderSectionView,
              segmentControl: StartSegmentControl,
              titleLabel: StarHeaderTextView,
              searchIconView: UIImageView,
              scrollView: UIScrollView,
              moviesCollectionView: UICollectionView) -> [NSLayoutConstraint] {

        let constraints = [
            headerSectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Dimensions.ten),
            headerSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerSectionView.heightAnchor.constraint(equalToConstant: Dimensions.fortyFour),

            segmentControl.topAnchor.constraint(equalTo: headerSectionView.bottomAnchor, constant: Dimensions.twentyFour),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Dimensions.twenty),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Dimensions.twenty),
            segmentControl.heightAnchor.constraint(equalToConstant: Dimensions.forty),

            titleLabel.centerYAnchor.constraint(equalTo: headerSectionView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: headerSectionView.leadingAnchor, constant: Dimensions.eighteen),

            searchIconView.centerYAnchor.constraint(equalTo: headerSectionView.centerYAnchor),
            searchIconView.trailingAnchor.constraint(equalTo: headerSectionView.trailingAnchor, constant: -Dimensions.eighteen),
            searchIconView.heightAnchor.constraint(equalToConstant: Dimensions.twentyFour),
            searchIconView.widthAnchor.constraint(equalToConstant: Dimensions.twentyFour),

            scrollView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: Dimensions.sixteen),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Dimensions.eighteen),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Dimensions.eighteen),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            moviesCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            moviesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesCollectionView.heightAnchor.constraint(equalToConstant: 540),
        ]
        
        return constraints
    }
}
