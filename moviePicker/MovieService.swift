//
//  MovieService.swift
//  moviePicker
//
//  Created by Ajay Kumar on 12/18/15.
//  Copyright © 2015 NexGen. All rights reserved.
//

import Foundation

protocol MovieServiceDelegate {
    func setMovie(movie: Movie)
}

class MovieService {
    
    var delegate: MovieServiceDelegate?
    
    func getMovie(movieTitle: String) {
        //request movie data 
        //..wait 
        // process data
        
        let movie = Movie(movieName: movieTitle, rating: 8.1, year: 2002)
        
        if delegate != nil {
            delegate?.setMovie(movie)
        }
        
    }
}