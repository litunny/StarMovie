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
        DispatchQueue.main.async {
            print(try! result.get())
        }
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
        view.addSubview([headerSectionView, segmentControl, scrollView])
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(Constraints
                                        .shared
                                        .home(view: view,
                                              headerSectionView: headerSectionView,
                                              segmentControl: segmentControl,
                                              titleLabel: titleLabel,
                                              searchIconView: searchIconView,
                                              scrollView: scrollView)
                                        )
    }
}
