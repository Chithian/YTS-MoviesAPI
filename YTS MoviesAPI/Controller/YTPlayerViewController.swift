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
        
        playerView.load(withVideoId: youtubeID!, playerVars: ["playsinline" : "1"])
    }

}
