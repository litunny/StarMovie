//
//  HomeController.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class HomeController: UIViewController {

    //MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Star Movie"
        label.font = .boldSystemFont(ofSize: Dimensions.twentyFour)
        return label
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
        view.addSubview([segmentControl])
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentControl.heightAnchor.constraint(equalToConstant: 40),


        ])
    }
}
