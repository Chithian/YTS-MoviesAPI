//
//  ViewController.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 23/2/21.
//

import UIKit


class MovieViewController: UIViewController {

    @IBOutlet weak var serachBox: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie]?
    var images: [UIImage]?
    
    var movieManager = MoviesManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        serachBox.layer.cornerRadius = 10
      
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

        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(searchTextFieldDidChange), for: .editingChanged)

    }
    
    @IBAction func searchBarPressed(_ sender: UIControl) {
        searchTextField.becomeFirstResponder()
    }
    
    @objc func searchTextFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            movieManager.getAllMovies()
            return
        }
        
        if let safeSearchString = textField.text {
            movieManager.getSearchedMovies(with: safeSearchString.lowercased())
        }
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

//MARK: UICollectionView Delegate

extension MovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("You Taped")
        performSegue(withIdentifier: Constants.movieDetailSegue , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailMovieViewController
        
        if let indexPaths = self.collectionView.indexPathsForSelectedItems {
//            print(indexPaths[0])
            let selectedMovie = self.movies![indexPaths[0].row]
            let movieImage = self.images![indexPaths[0].row]

            destination.titleLabel = selectedMovie.title
            destination.yearLabel = selectedMovie.year
            destination.runtimeLabel = selectedMovie.runtime
            destination.summaryLabel = selectedMovie.summary
            destination.longTitleLabel = selectedMovie.title_long
            destination.imageMovie = movieImage
            destination.rankingLabel = selectedMovie.rating
            destination.youtubeID = selectedMovie.yt_trailer_code

        }

    }
    
}

//MARK: UICollectionView DataSource
extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let safeMovies = movies else { return 0 }
        return safeMovies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.configure(with: UIImage(named: "monsterHunterMoive")!)

        let index = indexPath.row
        let movie = movies![index]
    
        cell.movieTitle.text = movie.title
        cell.movieRuntime.text = String(movie.runtime) + " min"
        cell.movieYear.text = String(movie.year)
        
        let image = images![index]
        cell .movieImage.image = image
        
        return cell
    }
    

}

//MARK: UICollectionView Delegate FlowLayout
extension MovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
         return CGSize(width: 200, height: 340)
    }
}

//MARK: MovieManager Delegate
extension MovieViewController: MovieManagerDelegate {
    func moviesManager(_ didUpdateWithMovies: [Movie], _ withMoviesImages: [UIImage]) {
        DispatchQueue.main.async {
            
            self.movies = didUpdateWithMovies
            self.images = withMoviesImages
            
            self.collectionView.reloadData()
        }
    }
    
}

// MARK: UITextFieldDelegate  Search
extension MovieViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        
        return true
    }
}




