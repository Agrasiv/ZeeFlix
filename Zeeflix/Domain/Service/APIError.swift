//
//  APIError.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation

enum APIErrorCode: Int {
    case invalid_session = 1001
}

class APIError: LocalizedError {
    
    let code: Int
    let message: String
    
    init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
    public var errorDescription: String? {
        message
    }
}
