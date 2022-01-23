//
//  Movie.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

struct Movie {
    var image : UIImage?
    var title : String
    var backgroundColor : UIColor

    init(image : UIImage?, title : String, backgroundColor : UIColor) {
        self.image = image
        self.title = title
        self.backgroundColor = backgroundColor
    }
}

