//
//  ApiManager.swift
//  Moviemy
//
//  Created by Ema Rivero on 19/07/2022.
//

import Foundation
import Alamofire

class ApiManager {
    static let shared = ApiManager()
    
    func getCall(url: String, success: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            success(response.result)
        }
    }
}


