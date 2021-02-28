//
//  MovieCollectionViewCell.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 24/2/21.
//

import UIKit


class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRuntime: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    
    
    static let identifier = "MovieCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    public func configure(with image: UIImage) {
        movieImage.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCollectionViewCell", bundle: nil)
    }
}
