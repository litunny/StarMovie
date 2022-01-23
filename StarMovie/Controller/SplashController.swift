//
//  SplashController.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class SplashController: UIViewController {

    //MARK: - Properties
    var logoImage: UIImageView = {
        let logoImage = UIImageView(image: UIImage(named: Constants.splashScreenLogo))
        logoImage.contentMode = .scaleAspectFill
        return logoImage
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        self.setupConstraints()
        self.setupTimer()
    }

    //MARK: - Events & Handlers
}

//MARK: - Extension

extension SplashController {
    func setupView() {
        view.backgroundColor = StarColors.primaryColor.color
        view.addSubview([logoImage])
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: Dimensions.splashScreenLogoHeight),
            logoImage.widthAnchor.constraint(equalToConstant: Dimensions.splashScreenLogoWidth),
        ])
    }

    func setupTimer() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            self.sceneDelegate?.navigateWithScene(using: MoviesController())
            timer.invalidate()
        }
    }
}
