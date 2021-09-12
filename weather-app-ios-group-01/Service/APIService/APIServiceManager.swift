//
//  APIServiceManager.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 09/09/2021.
//

import Alamofire
import Foundation

protocol APIServiceManager {
    // PerformRequest protocol doc
    func performRequest(url: String, params: Parameters?, completion: @escaping (Result<Data?, Error>) -> Void)
}
