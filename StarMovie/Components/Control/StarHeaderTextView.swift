//
//  StarHeaderTextView.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class StarHeaderTextView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .boldSystemFont(ofSize: Dimensions.twentyFour)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
