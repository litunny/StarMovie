//
//  HomeController.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit
import SFSafeSymbols

class HomeController: BaseController {

    //MARK: - Data Source
    private let movieViewModel = MovieViewModel()
    private var movieDataSource: CollectionViewDataSource<MovieCell, Movie>!

    //MARK: - Properties
    private let identifier = "MoviesCell"

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

    private lazy var moviesCollectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.refreshControl = refreshControl
        return collectionView
    }()

    let segmentControl = StartSegmentControl { result in }

    //MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage(named: "ic_home")

        self.setupView()
        self.setupConstraints()
        self.nowShowing()
    }
}

//MARK: - Extension
extension HomeController {

    @objc func nowShowing () {
        movieViewModel.getNowShowing { result in
            switch result {
            case .success(let movies):
                    guard let data = movies else { return }
                    self.configureCollectionView(data)
                break

            case .failure(let error):
                break
            }
        }
    }

    @objc func comingSoon () {
        movieViewModel.getComingSoon { result in
            switch result {
            case .success(let movies):
                    guard let data = movies else { return }
                    self.configureCollectionView(data)
                break

            case .failure(let error):
                break
            }
        }
    }

    func configureCollectionView(_ data: [Movie]) {
        DispatchQueue.main.async {
            self.movieDataSource = CollectionViewDataSource(cellIdentifier:
                                                            self.identifier,
                                                            items:  data,
                                                            size: CGSize(width: Dimensions.oneSixtyFour,
                                                                         height: Dimensions.threeFifty),
                                                            configureCell: { (cell, data) in
                cell.item = data
                cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onSelect(_:))))
            }, UIEdgeInsets(top: Dimensions.two,
                            left: Dimensions.eighteen,
                            bottom: Dimensions.two,
                            right: Dimensions.eighteen))


                self.moviesCollectionView.refreshControl?.beginRefreshing()
                self.moviesCollectionView.dataSource = self.movieDataSource
                self.moviesCollectionView.delegate = self.movieDataSource
                self.moviesCollectionView.reloadData()
        }
    }

    @objc private func onSelect(_ sender : UITapGestureRecognizer) {
        navigationController?.pushViewController(DetailController(), animated: true)
//        if let indexPath = self.moviesCollectionView.indexPathForItem(at: sender.location(in: self.moviesCollectionView)) {
//            navigationController?.pushViewController(DetailController(), animated: true)
//        }
    }
}

//MARK: - Extension
extension HomeController {
    func setupView () {
        self.headerSectionView.addSubview([titleLabel, searchIconView])
        view.addSubview([headerSectionView, segmentControl, moviesCollectionView])
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(Constraints
                                        .shared
                                        .home(view: view,
                                              headerSectionView: headerSectionView,
                                              segmentControl: segmentControl,
                                              titleLabel: titleLabel,
                                              searchIconView: searchIconView,
                                              moviesCollectionView: moviesCollectionView)
                                        )
    }
}
