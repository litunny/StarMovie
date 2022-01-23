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
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        return logoImage
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = StarColors.primaryColor.color
    }

    //MARK: - Events & Handlers
}

//MARK: - Extension

extension SplashController {
    func setupView() {

    }

    func setupConstraints() {
        
    }
}
