//
//  HomeController.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit
import SFSafeSymbols

class HomeController: BaseController {

    //MARK: - Properties
    private lazy var titleLabel: StarHeaderTextView = {
        let label = StarHeaderTextView()
        label.text = "Star Movie"
        return label
    }()

    private lazy var searchIconView: UIImageView = {
        let image = UIImage(systemSymbol: .magnifyingglass)
                    .withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private lazy var headerSectionView: StarHeaderSectionView = {
        let view = StarHeaderSectionView()
        return view
    }()

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: Constants.systemSizeWidth,
                                    height: Constants.systemSizeHeight + 120)
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = true
        scroll.refreshControl = refreshControl
        return scroll
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
        NSLayoutConstraint.activate(Constraints
                                        .shared
                                        .home(view: view,
                                              headerSectionView: headerSectionView,
                                              segmentControl: segmentControl,
                                              titleLabel: titleLabel,
                                              searchIconView: searchIconView)
                                        )
    }
}
