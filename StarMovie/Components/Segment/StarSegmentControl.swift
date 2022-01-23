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
        label.text = "Now showing"
        label.textColor = StarColors.whiteColor
        label.font = .boldSystemFont(ofSize: Dimensions.fourteen)
        return label
    }()

    var firstSegment: UIView = {
        let view = UIView()
        view.backgroundColor = StarColors.redColor
        view.layer.cornerRadius = Dimensions.sixteen
        return view
    }()

    var secondSegment: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = Dimensions.sixteen
        return view
    }()


    init(_ firstLabel: String, _ secondLabel: String) {
        self.firstLabel = firstLabel
        self.secondLabel = secondLabel

        super.init(frame: .zero)

        //Setup View
        self.setupView()

        //Setup Constraints
        self.setupConstraints()

        //Setup Selectors
        self.setupSelectors()
    }

    func setupView() {
        //Prepare view
        self.prepareView()

        //Inject subviews
        self.addSubview([firstSegment, secondSegment])

        self.firstSegment.addSubview([
            firstLabelView
        ])
    }

    func prepareView() {
        self.layer.borderColor = UIColor.systemGray2.cgColor
        self.layer.borderWidth = Dimensions.two
        self.layer.cornerRadius = Dimensions.twenty
        self.backgroundColor = .white
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

            //First Segment Constraints
            firstSegment.heightAnchor.constraint(equalToConstant: Dimensions.segmentHeight),
            firstSegment.widthAnchor.constraint(equalToConstant: Dimensions.segmentWidth),
            firstSegment.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Dimensions.four),
            firstSegment.topAnchor.constraint(equalTo: self.topAnchor, constant: Dimensions.four),

            //Second Segment Constraints
            secondSegment.heightAnchor.constraint(equalToConstant: Dimensions.segmentHeight),
            secondSegment.widthAnchor.constraint(equalToConstant: Dimensions.segmentWidth),
            secondSegment.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Dimensions.four),
            secondSegment.topAnchor.constraint(equalTo: self.topAnchor, constant: Dimensions.four),

            firstLabelView.centerYAnchor.constraint(equalTo: firstSegment.centerYAnchor),
            firstLabelView.centerXAnchor.constraint(equalTo: firstSegment.centerXAnchor),
        ])
    }

    func setupSelectors() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTapped)))
    }

    @objc func handleTapped() {
        print("Tapped!")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
