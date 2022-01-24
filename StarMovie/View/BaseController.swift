//
//  BaseController.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class BaseController: UIViewController {
    
    public lazy var refreshControl : UIRefreshControl = {
        let control = UIRefreshControl()
        return control
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
