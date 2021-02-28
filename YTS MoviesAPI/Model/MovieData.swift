//
//  MovieData.swift
//  YTS MoviesAPI
//
//  Created by Chithian on 23/2/21.
//

import UIKit


struct MovieData: Codable {
    let data: ResultsData
}

struct ResultsData: Codable {
    let movies: [Movie]
}

struct Movie: Codable {
//    let id: Int
    let title: String
    let title_long: String
    let summary: String
    let year: Int
    let runtime: Int
    let rating: Float
    let medium_cover_image: URL
    let yt_trailer_code: String
}



/*
 data.movies[0].id
 data.movies[0].medium_cover_image
 data.movies[0].title
 data.movies[0].year
 data.movies[1].runtime
 data.movies[0].large_cover_image
 data.movies[2].rating
 data.movies[0].title_long
 data.movies[0].summary
 data.movies[0].yt_trailer_code
*/
