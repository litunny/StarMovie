//
//  ApiService.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import Foundation

class ApiService : NSObject {

    private(set) var BaseUrl = "https://www.omdbapi.com/?apikey=f31735a6"

    func authRequest(path : String, method : HttpMethod,
                     body : [String : Any?]?, completion :
                        @escaping (Data?, Int?) -> ()) {

        let url = URL(string:
                        "\(self.BaseUrl)\(path)")!
        print("=====Request Full Path=====")
        print(url)


        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if method != HttpMethod.GET {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
            var rawRequest = try? JSONSerialization.jsonObject(with: request.httpBody!, options: [])
            print("====Raw Request====")
            print(rawRequest)
        }

        request.setValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig
             .timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0

        let session = URLSession(configuration: sessionConfig)

       session.dataTask(with: request) { (data, response, error) in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else { return }
            let rawValue = try? JSONSerialization.jsonObject(with: data, options: [])
            print("=====Raw Response======")
            print(rawValue)
            print("=====Raw Response======")
            completion(data, response.statusCode)
        }.resume()
    }
}


enum HttpMethod : String {
    case POST
    case GET
    case DELETE
    case PUT
    case OPTIONS
    func value() -> String {
        switch self {
            case .POST:
                return "POST"
            case .GET:
                return "GET"
            case .PUT:
                return "PUT"
            case .DELETE:
                return "DELETE"
            default:
                return "OPTIONS"
        }
    }
}
