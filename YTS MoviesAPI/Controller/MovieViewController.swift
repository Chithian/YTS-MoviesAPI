//
//  ViewController.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 23/2/21.
//

import UIKit


class MovieViewController: UIViewController {
    

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [Movie]()
    var images = [UIImage]()
    var movieManager = MoviesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieManager.delegate = self
        movieManager.fetchMovies()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 340)
        collectionView.collectionViewLayout = layout
    

        collectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Remove Navifation Bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        //Change Search Border
//        searchBar.barTintColor = UIColor.white
//        searchBar.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        
        

    }
   
   
    
    // Navigation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
      
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}



extension MovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You Taped")
        
        performSegue(withIdentifier: Constants.movieDetailSegue , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailMovieViewController
        
//        destination.movieTitle = titleLabel
//        destination.movieYear = yearLabel
//        destination.movieRunTime = runtimeLabel
//        destination.MovieSummaryLabel = summaryLabel
//
        
    }
}

extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.configure(with: UIImage(named: "monsterHunterMoive")!)
        
        let index = indexPath.row
        let movie = movies[index]
    
        cell.movieTitle.text = movie.title
        cell.movieRuntime.text = String(movie.runtime) + " min"
        cell.movieYear.text = String(movie.year)
        
        let image = images[index]
        cell .movieImage.image = image
        return cell
    }
    

}


extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 200, height: 340)
    }
}

extension MovieViewController: MovieManagerDelegate {
    func moviesManager(_ didUpdateWithMovies: [Movie], _ withMoviesImages: [UIImage]) {
        DispatchQueue.main.async {
            
            self.movies = didUpdateWithMovies
            self.images = withMoviesImages
            self.collectionView.reloadData()
        }
    }
    
    
}


extension MovieViewController: UITextFieldDelegate {
    
}
