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
    private var movieDataSource : CollectionViewDataSource<MovieCell, Movie>!

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

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: Constants.systemSizeWidth,
                                    height: Constants.systemSizeHeight + Dimensions.oneTwenty)
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.bounces = false
        scroll.alwaysBounceVertical = true
        scroll.refreshControl = refreshControl
        return scroll
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
        collectionView.bounces = true
        return collectionView
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
        self.initializeMovies()
    }
}

//MARK: - Extension
extension HomeController {

    func initializeMovies () {
        let data: [Movie] = [
            Movie(image: UIImage(named: "movie_john_wick"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_captain_marvel"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_john_wick"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_captain_marvel"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_john_wick"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_captain_marvel"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_john_wick"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_captain_marvel"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_john_wick"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_captain_marvel"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_john_wick"), title: "Title", backgroundColor: .systemPink),
            Movie(image: UIImage(named: "movie_captain_marvel"), title: "Title", backgroundColor: .systemPink),
        ]

        self.movieDataSource = CollectionViewDataSource(cellIdentifier:
                                                        identifier,
                                                        items:  data,
                                                        size: CGSize(width: 164, height: 250),
                                                        configureCell: { [weak self] (cell, data) in
            cell.item = data
        }, UIEdgeInsets(top: 2, left: 18, bottom: 2, right: 18))

        DispatchQueue.main.async {
            self.moviesCollectionView.dataSource = self.movieDataSource
            self.moviesCollectionView.delegate = self.movieDataSource
            self.moviesCollectionView.reloadData()
        }
    }
}

//MARK: - Extension
extension HomeController {

    func setupView () {

        self.headerSectionView.addSubview([titleLabel, searchIconView])
        self.scrollView.addSubview([moviesCollectionView])
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
                                              scrollView: scrollView,
                                              moviesCollectionView: moviesCollectionView)
                                        )
    }
}
