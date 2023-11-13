//
//  PopularMovieCell.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import UIKit

class PopularMovieCell : UICollectionViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    
    var popularModel : PopularMovieModelResponseData! {
        didSet {
            let image = "https://image.tmdb.org/t/p/w500" + "\(popularModel.backdrop_path ?? "")"
            imgMovie.setImage(with: image)
            lbName.text = popularModel.original_title
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
