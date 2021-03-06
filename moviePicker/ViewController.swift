//
//  ViewController.swift
//  moviePicker
//
//  Created by Ajay Kumar on 12/16/15.
//  Copyright © 2015 NexGen. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ViewController: UIViewController,MovieServiceDelegate, UITextFieldDelegate{
    
    
    let movieService = MovieService()
    
    @IBOutlet var selectedMovie: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var movieChoiceOne: UITextField!
    @IBOutlet var movieChoiceTwo: UITextField!
    @IBOutlet var movieChoiceThree: UITextField!
    
    
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieRatingLabel: UILabel!
    @IBOutlet var movieDateLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.movieService.delegate = self
        
        //        Alamofire.request(.GET, "https://api.themoviedb.org/3/movie/550?api_key=c79b9571d2ab98df56637922cb4e93d5")
        //            .responseJSON { response in
        //                print(response)
        //            let json = JSON(data: data!)
        //        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: -Movie Service Delegate
    func setMovie(movie: Movie) {
        // print("Movie: \(movie.movieName) rating:\(movie.rating) year: \(movie.year)")
        movieTitleLabel.text = movie.movieName
        movieRatingLabel.text = "\(movie.rating)"
        movieDateLabel.text = "\(movie.year)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func highestRatedButton(sender: AnyObject) {
        //code
        
        //self.movieService.getMovie("Catch me if you can")
    }
    
    @IBAction func randomMovieButton(sender: AnyObject) {
        let random_num = Int(arc4random_uniform(3))
        
        if (random_num == 0) {
            let choiceOneMovie = movieChoiceOne?.text
            self.movieService.getMovie(choiceOneMovie!)
        }
        
        if (random_num == 1) {
            let choiceTwoMovie = movieChoiceTwo?.text
            self.movieService.getMovie(choiceTwoMovie!)
        }
        if (random_num == 2) {
            let choiceThreeMovie = movieChoiceThree?.text
            self.movieService.getMovie(choiceThreeMovie!)
        }
        
        
    }
}
