//
//  MovieCollectionViewCell.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 24/2/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "MovieCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage) {
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCollectionViewCell", bundle: nil)
    }
}
