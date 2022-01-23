//
//  HomeController.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit
import SFSafeSymbols

class HomeController: UIViewController {

    //MARK: - Properties
    private let titleLabel: StarHeaderTextView = {
        let label = StarHeaderTextView()
        label.text = "Star Movie"
        return label
    }()

    private let searchIconView: UIImageView = {
        let image = UIImage(systemSymbol: .magnifyingglass)
                    .withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private let headerSectionView: StarHeaderSectionView = {
        let view = StarHeaderSectionView()
        return view
    }()

    let segmentControl = StartSegmentControl { result in
        print(try! result.get())
    }

    //MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage(named: "ic_home")

        self.setupView()
        self.setupConstraints()
    }

    //MARK: - Selector
}

//MARK: - Extension
extension HomeController {

    func setupView () {
        self.headerSectionView.addSubview([titleLabel, searchIconView])
        view.addSubview([headerSectionView, segmentControl])
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
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

        ])
    }
}
