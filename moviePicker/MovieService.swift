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
        
        
        let path = "https://api.themoviedb.org/3/movie/550?api_key=c79b9571d2ab98df56637922cb4e93d5"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //print(">>>> \(data)")
            let json = JSON(data: data!)
            let rating = json["vote_average"].double
            let id = json["id"].int
            
            print("Rating: \(rating!) ID: \(id!)")
            
            //self.movieService.getMovie(DeepaksMovie)
            
        }
        task.resume()

//        let movie = Movie(movieName: movieTitle, rating: 8.1, year: 2002)
//        
//        if delegate != nil {
//            delegate?.setMovie(movie)
//        }
        
    }
}