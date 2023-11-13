//
//  MovieDetail.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import UIKit

class MovieDetail : BaseViewController {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbOverView: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    var ImageString : String?
    var Name : String?
    var Overview : String?
    var Date : String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputData()
    }
    
    func inputData() {
        let image = "https://image.tmdb.org/t/p/w500" + "\(ImageString ?? "")"
        self.lbName.text = Name
        self.imgMovie.setImage(with: image)
        self.lbOverView.text = Overview
        self.lbDate.text = Date
    }
}
