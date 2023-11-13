//
//  APIservice.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import Alamofire

class ApiService {
    
    static func getHeaders() -> HTTPHeaders {
        var headers: HTTPHeaders = [:]
        headers["Accept"] = "application/json"
        return headers
    }
}
