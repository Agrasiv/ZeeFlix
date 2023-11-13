//
//  UpcomingMovieDAO.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import Alamofire

class UpcomingMovieDAO {
    
     static let shared = UpcomingMovieDAO()
     private init() {}
    
    func getUpcomingMovie(completion: @escaping ApiResult<UpcomingMovieResponse>) {
        let header = ApiService.getHeaders()
        
        AlamofireService.shared.request(UpcomingMovieResponse.self,
                                        at: Constants.API.apiupcomingUrl + Constants.API.apiKey,
                                        headers: header,
                                        method: .get,
                                        encoding: JSONEncoding.default,
                                        completion: completion)
    }
}
