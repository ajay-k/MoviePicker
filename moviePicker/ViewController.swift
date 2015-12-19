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

class ViewController: UIViewController,MovieServiceDelegate {

    let movieService = MovieService()
    
    @IBOutlet var selectedMovie: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.movieService.delegate = self
        
        let path = "https://api.themoviedb.org/3/movie/550?api_key=c79b9571d2ab98df56637922cb4e93d5"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //print(">>>> \(data)")
            let json = JSON(data: data!)
            let rating = json["vote_average"].double
            self.DeepaksChoiceAction.text = "\(rating!)"
            let DeepaksMovie = self.DeepaksChoiceAction.text!
            self.movieService.getMovie(DeepaksMovie)
            print("Rating: \(rating!)")

            
        }
        task.resume()
        
//        Alamofire.request(.GET, "https://api.themoviedb.org/3/movie/550?api_key=c79b9571d2ab98df56637922cb4e93d5")
//            .responseJSON { response in
//                print(response)
//            let json = JSON(data: data!)
//        }
        
    }
    
    //MARK: -Movie Service Delegate 
    func setMovie(movie: Movie) {
        print("*** Set Weather")
        print("Movie: \(movie.movieName) rating:\(movie.rating) year: \(movie.year)")
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBOutlet var DeepaksChoiceAction: UITextField!
    
    @IBOutlet var AjaysChoiceAction: UITextField!
    
    @IBOutlet var VineetsChoiceAction: UITextField!
    
    @IBOutlet var selectedMovieAction: UITextField!
    
    @IBAction func chooseMovieAction(sender: UIButton) {
        
        
          self.movieService.getMovie(DeepaksChoiceAction.text!)
//        let random_num = Int(arc4random_uniform(3))
//
//        if (random_num == 0)
//        {
//            selectedMovieAction.text = "\(DeepaksChoiceAction.text!)"
//        }
//        else if (random_num == 1)
//        {
//            selectedMovieAction.text =
//                "\(AjaysChoiceAction.text!)"
//        }
//        else {
//            selectedMovieAction.text =
//                "\(VineetsChoiceAction.text!)"
//        }
    }
}

