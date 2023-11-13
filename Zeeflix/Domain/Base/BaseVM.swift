//
//  BaseVM.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation

class BaseVM {
    var loading: ((Bool) -> Void)?
    var error: ((String) -> Void)?
}
