//
//  DetailMovieViewController.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 23/2/21.
//

import UIKit


class DetailMovieViewController: UIViewController {

//    @IBOutlet weak var watchNowButton: UIButton!
    
    @IBOutlet weak var watchNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
//        Watch Now Button

        watchNowButton.layer.cornerRadius = 20
        watchNowButton.layer.shadowColor = UIColor.black.cgColor
        watchNowButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        watchNowButton.layer.shadowRadius = 10
        watchNowButton.layer.shadowOpacity = 0.7

        
//        NavigationBar
        
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