//
//  Movie.swift
//  moviePicker
//
//  Created by Ajay Kumar on 12/18/15.
//  Copyright © 2015 NexGen. All rights reserved.
//

import Foundation

struct Movie {
    let movieName: String
    let rating: Double
    let year: Int
    
    init(movieName: String, rating: Double, year: Int) {
        self.movieName = movieName
        self.rating = rating
        self.year = year
    }
}