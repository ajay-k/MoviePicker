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
        Alamofire.request(.GET, "https://api.themoviedb.org/3/movie/550?api_key=c79b9571d2ab98df56637922cb4e93d5", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        
        
    }
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

