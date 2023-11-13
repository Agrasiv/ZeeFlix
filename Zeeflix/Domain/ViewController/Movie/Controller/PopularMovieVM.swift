//
//  PopularMovieVM.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation

protocol PopularMovieVMProtocol {
    func loadPopularMovie()
}

class PopularMovieVM : BaseVM, PopularMovieVMProtocol {
    
    var popularMovieList : (([PopularMovieModelResponseData]) -> Void)?
    
    func loadPopularMovie() {
        self.loading?(true)
        PopularMovieDAO.shared.getPopularMovie { [weak self] (response, error) in
            guard let self = self else {return}
            self.loading?(false)
            if let data = response?.data {
                self.popularMovieList?(data)
            } else {
                self.error?(error!.localizedDescription)
                return
            }
        }
    }
}
