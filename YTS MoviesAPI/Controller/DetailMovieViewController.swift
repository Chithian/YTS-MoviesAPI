//
//  DetailMovieViewController.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 23/2/21.
//

import UIKit


class DetailMovieViewController: UIViewController {

    
    @IBOutlet weak var watchNowButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        watchNowButton.layer.cornerRadius = 16
        watchNowButton.layer.shadowColor = UIColor.black.cgColor
        watchNowButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        watchNowButton.layer.shadowRadius = 10
        watchNowButton.layer.shadowOpacity = 0.7
        
        
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
