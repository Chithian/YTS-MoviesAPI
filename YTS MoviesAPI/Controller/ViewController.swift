//
//  ViewController.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 23/2/21.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        //Center search text
        if let searchBarTextField = searchBar.value(forKey: "searchField") as? UITextField {

                //Center search text
                searchBarTextField.textAlignment = .center

                //Center placeholder
                let width = searchBar.frame.width / 2 - (searchBarTextField.attributedPlaceholder?.size().width)!
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: searchBar.frame.height))
                searchBarTextField.leftView = paddingView
                searchBarTextField.leftViewMode = .unlessEditing
            }
    }


}

