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
//                    fetchMoviesImages()
//                    if let safeMovies = self.movies, let safeImages = self.moviesImages {
//                        checkDelegate(safeMovies, safeImages)
//                    }
                    
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
    
    
}
