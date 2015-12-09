//
//  ViewController.swift
//  Accessible App
//
//  Created by Saqlain Golandaz on 9/2/15.
//  Copyright (c) 2015 SaqlainGolandaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel!
    
    
    var cityString:String = ""
    var tempString:String = ""
    var feelsLikeString:String = ""
    var precipString:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setWeatherInfo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setWeatherInfo() {
        let url = NSURL(string:"https://api.wunderground.com/api/16337742f9b11efe/conditions/q/autoip.json")
        let returnedData = NSData(contentsOfURL: url!)
        
        var parsedObject:NSDictionary = [:]
        
        do {
            parsedObject = try NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        } catch let error as NSError {
            // Catch fires here, with an NSErrro being thrown from the JSONObjectWithData method
            print("A JSON parsing error occurred, here are the details:\n \(error)")
        }
        
        let topLevel: NSDictionary = parsedObject["current_observation"] as! NSDictionary
        let secondLevel: NSDictionary = topLevel["display_location"] as! NSDictionary

        self.cityString = secondLevel["full"] as! String
        locationLabel.text = self.cityString

        self.tempString = topLevel["temperature_string"] as! String
        temperatureLabel.text = self.tempString

        self.feelsLikeString = topLevel["feelslike_string"] as! String
        feelsLikeLabel.text = "Feels Like: " + self.feelsLikeString

        self.precipString = topLevel["precip_today_string"] as! String
        precipLabel.text = "Precipitation: " + self.precipString
    }


}

