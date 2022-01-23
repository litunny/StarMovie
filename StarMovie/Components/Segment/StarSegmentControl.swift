//
//  StarSegmentControl.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class StartSegmentControl: UIView {

    //MARK: - Properties
    private var firstLabel: String {
        willSet {
            firstLabelView.text = newValue
        }
    }
    private var secondLabel: String

    var firstLabelView: UILabel = {
        let label = UILabel()

        return label
    }()


    init(_ firstLabel: String, _ secondLabel: String) {
        self.firstLabel = firstLabel
        self.secondLabel = secondLabel

        super.init(frame: .zero)

        self.layer.borderColor = UIColor.systemGray2.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 20
        self.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            
        ])

        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTapped)))
    }

    @objc func handleTapped() {
        print("Tapped!")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
