//
//  StarSegmentControl.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit
import SFSafeSymbols

class StartSegmentControl: UIView {

    //MARK: - Properties
    private var result: ((Result<Int, Error>) -> Void)!

    var firstLabelView: UILabel = {
        let label = UILabel()
        label.text = "Now Showing"
        label.textColor = StarColors.whiteColor
        label.font = .boldSystemFont(ofSize: Dimensions.fourteen)
        return label
    }()

    var secondLabelView: UILabel = {
        let label = UILabel()
        label.text = "Coming Soon"
        label.textColor = UIColor.systemGray2
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

    var playIconView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemSymbol: .playCircleFill))
        imageView.tintColor = StarColors.whiteColor
        imageView.clipsToBounds = true
        return imageView
    }()

    init(_ result: @escaping (Result<Int, Error>) -> Void) {

        self.result = result

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

        self.firstSegment.addSubview([playIconView, firstLabelView])
        self.secondSegment.addSubview([secondLabelView])
    }

    func prepareView() {
        self.layer.borderColor = UIColor.systemGray2.cgColor
        self.layer.borderWidth = Dimensions.one
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

            //Play Icon View Constraints
            playIconView.centerYAnchor.constraint(equalTo: firstSegment.centerYAnchor),
            playIconView.leadingAnchor.constraint(equalTo: firstSegment.leadingAnchor, constant: Dimensions.eighteen),
            playIconView.heightAnchor.constraint(equalToConstant: Dimensions.eighteen),
            playIconView.widthAnchor.constraint(equalToConstant: Dimensions.eighteen),

            //First Label View Constraints
            firstLabelView.centerYAnchor.constraint(equalTo: firstSegment.centerYAnchor),
            firstLabelView.leadingAnchor.constraint(equalTo: playIconView.trailingAnchor, constant: 10),

            secondLabelView.centerYAnchor.constraint(equalTo: secondSegment.centerYAnchor),
            secondLabelView.centerXAnchor.constraint(equalTo: secondSegment.centerXAnchor),
        ])
    }

    func setupSelectors() {
        self.firstSegment.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFirstSegment)))
        self.secondSegment.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSecondSegment)))
    }

    @objc func handleFirstSegment() {
        self.secondSegment.backgroundColor = .clear
        self.secondLabelView.textColor = UIColor.systemGray2

        self.firstSegment.backgroundColor = StarColors.redColor
        self.firstLabelView.textColor = UIColor.white

        self.playIconView.tintColor = StarColors.whiteColor

        result!(.success(0))
    }

    @objc func handleSecondSegment() {
        self.secondSegment.backgroundColor = StarColors.redColor
        self.secondLabelView.textColor = UIColor.white

        self.firstSegment.backgroundColor = .clear
        self.firstLabelView.textColor = UIColor.systemGray2

        self.playIconView.tintColor = StarColors.redColor

        result!(.success(1))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
