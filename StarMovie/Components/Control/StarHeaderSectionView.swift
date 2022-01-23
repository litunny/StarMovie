//
//  HeaderSectionView.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class StarHeaderSectionView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addBottomShadow()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
