//
//  MovieManager.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 23/2/21.
//

import Foundation
import UIKit

protocol MovieManagerDelegate {
    func moviesManager(_ didUpdateWithMovies: [Movie], _ withMoviesImages: [UIImage])
}

class MoviesManager {
    
    var delegate: MovieManagerDelegate?
    
    let urlString = "https://yts.mx/api/v2/list_movies.json"
    
    var movies : [Movie]?
    var moviesImages: [UIImage]?
   
    
    func fetchMovies() {
        guard let url = URL(string: urlString) else { return }
        let urlSession = URLSession(configuration: .default)
        let dataTask = urlSession.dataTask(with: url) { [self] (data, urlResponse, error) in
            if let safeData = data {
                let jsonDecoder = JSONDecoder()
                do {
                    
                    let root = try jsonDecoder.decode(MovieData.self, from: safeData)
                    self.movies = root.data.movies
                    fetchMoviesImages()
                    if let safeMovies = self.movies, let safeImages = self.moviesImages {
                        checkDelegate(safeMovies, safeImages)
                    }
                    
                } catch {
                    print("Fetch Movie error \(error)")
                }
            }
        }
        
        dataTask.resume()
    }
    
    
    
    func fetchMoviesImages() {
        
        var images = [UIImage]()
        
        if let safeMovies = movies {
            for movie in safeMovies {
                
                if let dataImage = try? Data(contentsOf: movie.medium_cover_image) {
                    if let safeImage = UIImage(data: dataImage) {
                        images.append(safeImage)
                    }
                } else {
                    images.append(UIImage(systemName: "questionmark.folder.fill")!)
                }
            }
            moviesImages = images
        }
    }
    
    func getAllMovies() {
        if let safeMovies = movies, let safeImages = moviesImages {
            checkDelegate(safeMovies, safeImages)
        }
    }
    
    func checkDelegate(_ movies: [Movie], _ moviesImages: [UIImage]) {
        if let safeDelegate = delegate {
                safeDelegate.moviesManager(movies, moviesImages)
        }
    }

    func getSearchedMovies(with searchString: String) {
        
        var searchedMovies = [Movie]()
        var searchedMoviesImages = [UIImage]()
        
        if let safeMovies = movies, let safeImages = moviesImages, let count = movies?.count {
            for index in 0..<count {
                
                if safeMovies[index].title.lowercased().contains(searchString) {
                    
                    searchedMovies.append(safeMovies[index])
                    searchedMoviesImages.append(safeImages[index])
                }
            }
        }
        
        checkDelegate(searchedMovies, searchedMoviesImages)
    }
    
}
