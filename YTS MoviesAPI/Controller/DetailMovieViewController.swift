//
//  DetailMovieViewController.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 23/2/21.
//

import UIKit
import Cosmos


class DetailMovieViewController: UIViewController {

    
    @IBOutlet weak var moiveImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var watchNowButton: UIButton!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRunTime: UILabel!
    @IBOutlet weak var movieLongtitle: UILabel!
    
    @IBOutlet weak var rankingCosmosView: CosmosView!
    
    var titleLabel: String?
    var yearLabel: Int?
    var runtimeLabel: Int?
    var rankingLabel: Float?
    var summaryLabel: String?
    var longTitleLabel: String?
    var youtubeID: String?
    var imageMovie: UIImage?
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        moiveImage.image = imageMovie
        movieTitleLabel.text = titleLabel
        movieYear.text = String(yearLabel!)
        movieRunTime.text = String(runtimeLabel!) + " min"
        movieLongtitle.text = longTitleLabel
        movieSummaryLabel.text = summaryLabel

        rankingCosmosView.rating = Double(rankingLabel! / 2)
        


//        Watch Now Button

        watchNowButton.layer.cornerRadius = 20
        watchNowButton.layer.shadowColor = UIColor.black.cgColor
        watchNowButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        watchNowButton.layer.shadowRadius = 10
        watchNowButton.layer.shadowOpacity = 0.7
        
        
        // Do not change rating when touched
        // Use if you need just to show the stars without getting user's input
        rankingCosmosView.settings.updateOnTouch = false
        
//        NavigationBar
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        

//        
     //Remove Boder Navigation
        self.navigationController?.navigationBar.layoutIfNeeded()
 
        
    }
    
    @IBAction func WatchNowPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.youtubeSegue , sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
