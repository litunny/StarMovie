//
//  MovieViewModel.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit
import Combine
import SwiftUI

class MovieViewModel: ObservableObject {

    private(set) var apiService : ApiService!

    init() {
        self.apiService = ApiService()
    }

    func getNowShowing(_ result: @escaping (Result<[Movie]?, MovieError>) -> Void) {
        self.apiService.authRequest(path: "&s=movies&plot=full", method: .GET, body: nil) { data, statusCode in
            switch (statusCode!) {
            case 200...299:
                    let res = try? JSONDecoder().decode(MovieSearch.self, from: data!)
                    result(.success(res?.search))
                break

            default:
                result(.failure(.networkError))
                break
            }
        }
    }

    func getComingSoon(_ result: @escaping (Result<[Movie]?, MovieError>) -> Void) {
        self.apiService.authRequest(path: "&s=series&plot=full", method: .GET, body: nil) { data, statusCode in
            switch (statusCode!) {
            case 200...299:
                    let res = try? JSONDecoder().decode(MovieSearch.self, from: data!)
                    result(.success(res?.search))
                break

            default:
                result(.failure(.networkError))
                break
            }
        }
    }
}
