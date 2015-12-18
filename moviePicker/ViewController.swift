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

class ViewController: UIViewController {

    @IBOutlet var selectedMovie: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let siteAddress = "https://api.themoviedb.org/3/movie/550?api_key=c79b9571d2ab98df56637922cb4e93d5"
        let url = NSURL (string: siteAddress)
        let urlRequest = NSURLRequest(URL: url!)
        
        let request = Alamofire.request(.GET, urlRequest)
        
        print(request)
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
        let random_num = Int(arc4random_uniform(3))

        if (random_num == 0)
        {
            selectedMovieAction.text = "\(DeepaksChoiceAction.text!)"
        }
        else if (random_num == 1)
        {
            selectedMovieAction.text =
                "\(AjaysChoiceAction.text!)"
        }
        else {
            selectedMovieAction.text =
                "\(VineetsChoiceAction.text!)"
        }
    }
}

