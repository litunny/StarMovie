//
//  MoviesController.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class MoviesController: UITabBarController {

    //MARK: - Properties
    let controllers : [UIViewController] = [
        HomeController(),
        TicketController(),
        NotificationController(),
        ProfileController()
    ]

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        self.setupConstraints()
    }

    //MARK: - Selector
}

//MARK: - Extension
extension MoviesController {
    func setupView() {
        view.backgroundColor = .white
        viewControllers = self.controllers

        self.tabBar.isTranslucent = true
        UITabBar.appearance().backgroundImage = UIImage()

        //This is for removing top line from the tabbar.
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
    }

    func setupConstraints() {

    }
}
