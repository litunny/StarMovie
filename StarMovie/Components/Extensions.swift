//
//  Extensions.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

extension UIViewController {
    var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let delegate = windowScene.delegate as? SceneDelegate else { return nil }
         return delegate
    }
}

extension UIView {
    func addSubview(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }

    func addSubview(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }

    func addBottomShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = Dimensions.four
        layer.shadowOpacity = Float(Dimensions.one)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: Dimensions.zero , height: Dimensions.two)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: Dimensions.zero,
                                                     y: bounds.maxY - layer.shadowRadius,
                                                     width: bounds.width,
                                                     height: layer.shadowRadius)).cgPath
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red) / 255
        let newGreen = CGFloat(green) / 255
        let newBlue = CGFloat(blue) / 255

        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }

    convenience init(rgbHex: Int) {
        self.init(
            red: (rgbHex >> 16) & 0xFF,
            green: (rgbHex >> 8) & 0xFF,
            blue: rgbHex & 0xFF
        )
    }

    convenience init(hexString: String) {
        let hex = Int(hexString, radix: 16) ?? 0
        self.init(rgbHex: hex)
    }

    var color: UIColor { UIColor(cgColor: self.cgColor) }
}
