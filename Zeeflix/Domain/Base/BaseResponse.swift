//
//  BaseResponse.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable {
    
    var page: Int = 0
    var dates: String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        page            <- map["page"]
        dates           <- map["dates"]
    }
    
    func isSuccess() -> Bool {
        return page == 1
    }
}
