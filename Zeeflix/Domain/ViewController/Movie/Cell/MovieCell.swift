//
//  MovieCell.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import Foundation
import UIKit

protocol MovieCellDelegate {
    func onTapAdd(cell: MovieCell)
}

class MovieCell : UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    
    var upcomingModel : UpcomingMovieResponseData! {
        didSet {
            let image = "https://image.tmdb.org/t/p/w500" + "\(upcomingModel.backdrop_path ?? "")"
            imgMovie.setImage(with: image)
            lbName.text = upcomingModel.original_title
        }
    }
    
    var delegate : MovieCellDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func clickFav(_ sender: Any) {
        delegate?.onTapAdd(cell: self)
    }
}
