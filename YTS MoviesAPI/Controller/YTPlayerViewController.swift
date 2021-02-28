//
//  YTPlayerViewController.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 26/2/21.
//

import UIKit
import youtube_ios_player_helper


class YTPlayerViewController: UIViewController {

    @IBOutlet weak var playerView: YTPlayerView!
    
    var youtubeID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        playerView.load(withVideoId: youtubeID!, playerVars: ["playsinline" : "1"])
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
