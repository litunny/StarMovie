//
//  Movie.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

struct Movie: Decodable, Encodable {
    let title : String
    let year : String
    let imdbID : String
    let type: String
    let poster: String

    enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct MovieSearch: Decodable, Encodable {
    let search : [Movie]?

    enum CodingKeys : String, CodingKey {
        case search = "Search"
    }
}

enum MovieError: Error {
    case networkError
    case badRequest
}
