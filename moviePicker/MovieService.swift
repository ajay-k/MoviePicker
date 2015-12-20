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
        
        let movieEscaped = movieTitle.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let path = "http://api.themoviedb.org/3/search/movie?api_key=c79b9571d2ab98df56637922cb4e93d5&query=\(movieEscaped!)"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //print(">>>> \(data)")
            let json = JSON(data: data!)
            let rating = json["results"][0]["vote_average"].double
            let movieTitle = json["results"][0]["original_title"].string
            let releaseDate = json["results"][0]["release_date"].string
            
            let movie = Movie(movieName: movieTitle!, rating: rating!, year: releaseDate!)
            
            //            print("\(movieTitle)")
            //            print("\n\(rating)")
            //            print("\n\(releaseDate)")
            //let movie = Movie(movieName: "Test")
            
            if self.delegate != nil {
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.setMovie(movie)
                })
            }
            // print(" Movie: \(movieTitle!) \n Rating: \(rating!) \n Release Date: \(releaseDate!)")
            
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