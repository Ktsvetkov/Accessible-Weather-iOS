//
//  WeeklyWeatherClass.swift
//  Accessible App
//
//  Created by Saqlain Golandaz on 9/23/15.
//  Copyright (c) 2015 SaqlainGolandaz. All rights reserved.
//

import UIKit

class WeeklyWeatherClass: UIViewController {
    
    
    @IBOutlet weak var time1Label: UILabel!
    @IBOutlet weak var forecast1Label: UILabel!
    @IBOutlet weak var high1Label: UILabel!
    @IBOutlet weak var low1Label: UILabel!
    @IBOutlet weak var precip1Label: UILabel!
    @IBOutlet weak var img1Label: UIImageView!
    
    
    @IBOutlet weak var time2Label: UILabel!
    @IBOutlet weak var forecast2Label: UILabel!
    @IBOutlet weak var high2Label: UILabel!
    @IBOutlet weak var low2Label: UILabel!
    @IBOutlet weak var precip2Label: UILabel!
    @IBOutlet weak var img2Label: UIImageView!
    
    
    @IBOutlet weak var time3Label: UILabel!
    @IBOutlet weak var forecast3Label: UILabel!
    @IBOutlet weak var high3Label: UILabel!
    @IBOutlet weak var low3Label: UILabel!
    @IBOutlet weak var precip3Label: UILabel!
    @IBOutlet weak var img3Label: UIImageView!
    
    @IBOutlet weak var time4Label: UILabel!
    @IBOutlet weak var forecast4Label: UILabel!
    @IBOutlet weak var high4Label: UILabel!
    @IBOutlet weak var low4Label: UILabel!
    @IBOutlet weak var precip4Label: UILabel!
    @IBOutlet weak var img4Label: UIImageView!
    
    @IBOutlet weak var time5Label: UILabel!
    @IBOutlet weak var forecast5Label: UILabel!
    @IBOutlet weak var high5Label: UILabel!
    @IBOutlet weak var low5Label: UILabel!
    @IBOutlet weak var precip5Label: UILabel!
    @IBOutlet weak var img5Label: UIImageView!
    
    
    
    
    
    var time1String:String = ""
    var forecast1String:String = ""
    var high1String:String = ""
    var low1String:String = ""
    var precip1String:String = ""
    var img1String:String = ""
    
    var time2String:String = ""
    var forecast2String:String = ""
    var high2String:String = ""
    var low2String:String = ""
    var precip2String:String = ""
    var img2String:String = ""
    
    var time3String:String = ""
    var forecast3String:String = ""
    var high3String:String = ""
    var low3String:String = ""
    var precip3String:String = ""
    var img3String:String = ""
    
    var time4String:String = ""
    var forecast4String:String = ""
    var high4String:String = ""
    var low4String:String = ""
    var precip4String:String = ""
    var img4String:String = ""
    
    var time5String:String = ""
    var forecast5String:String = ""
    var high5String:String = ""
    var low5String:String = ""
    var precip5String:String = ""
    var img5String:String = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        weeklyData()
    }
    
    func weeklyData() {
        let url = NSURL(string:"https://api.wunderground.com/api/16337742f9b11efe/forecast10day/q/autoip.json")
        let returnedData = NSData(contentsOfURL: url!)
        
        var parsedData:NSDictionary = [:]
        
        do {
            parsedData = try NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers)as! NSDictionary
        } catch let error as NSError {
            // Catch fires here, with an NSErrro being thrown from the JSONObjectWithData method
            print("A JSON parsing error occurred, here are the details:\n \(error)")
        }
        var main:NSDictionary = parsedData["forecast"] as! NSDictionary
        var simpleForecast:NSDictionary = main["simpleforecast"] as! NSDictionary
        var forecastDay:NSArray = simpleForecast["forecastday"] as! NSArray
        var txtForecast:NSDictionary = main["txt_forecast"] as! NSDictionary
        
        var days1:NSDictionary = forecastDay[1] as! NSDictionary
        var date1:NSDictionary = days1["date"] as! NSDictionary
        self.time1String = date1["weekday"] as! NSString as String
        self.time1Label.text = self.time1String
        self.forecast1String = days1["conditions"] as! NSString as String
        self.forecast1Label.text = self.forecast1String
        var high1:NSDictionary = days1["high"] as! NSDictionary
        var hi1:NSString = high1["fahrenheit"] as! NSString
        self.high1String = "High: " + (hi1 as String) + "ºF"
        self.high1Label.text = self.high1String
        var low1:NSDictionary = days1["low"] as! NSDictionary
        var lo1:NSString = low1["fahrenheit"] as! NSString
        self.low1String = "Low: " + (lo1 as String) + "ºF"
        self.low1Label.text = self.low1String
        var img1:NSString = days1["icon_url"] as! NSString
        var pic1 = NSURL(string: img1 as String)
        var pic11 = NSData(contentsOfURL: pic1!)
        self.img1Label.image = UIImage(data: pic11!)
        var rainIsWeird1:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird11:NSDictionary = rainIsWeird1[2] as! NSDictionary
        var rainIsWeird111:NSString = rainIsWeird11["pop"] as! NSString
        self.precip1String = "Chance of Rain: " + (rainIsWeird111 as String) + "%"
        self.precip1Label.text = self.precip1String
        
        var days2:NSDictionary = forecastDay[2] as! NSDictionary
        var date2:NSDictionary = days2["date"] as! NSDictionary
        self.time2String = date2["weekday"] as! NSString as String
        self.time2Label.text = self.time2String
        self.forecast2String = days2["conditions"] as! NSString as String
        self.forecast2Label.text = self.forecast2String
        var high2:NSDictionary = days2["high"] as! NSDictionary
        var hi2:NSString = high2["fahrenheit"] as! NSString
        self.high2String = "High: " + (hi2 as String) + "ºF"
        self.high2Label.text = self.high2String
        var low2:NSDictionary = days2["low"] as! NSDictionary
        var lo2:NSString = low2["fahrenheit"] as! NSString
        self.low2String = "Low: " + (lo2 as String) + "ºF"
        self.low2Label.text = self.low2String
        var img2:NSString = days2["icon_url"] as! NSString
        var pic2 = NSURL(string: img2 as String)
        var pic22 = NSData(contentsOfURL: pic2!)
        self.img2Label.image = UIImage(data: pic22!)
        var rainIsWeird2:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird22:NSDictionary = rainIsWeird1[4] as! NSDictionary
        var rainIsWeird222:NSString = rainIsWeird22["pop"] as! NSString
        self.precip2String = "Chance of Rain: " + (rainIsWeird222 as String) + "%"
        self.precip2Label.text = self.precip2String
        
        var days3:NSDictionary = forecastDay[3] as! NSDictionary
        var date3:NSDictionary = days3["date"] as! NSDictionary
        self.time3String = date3["weekday"] as! NSString as String
        self.time3Label.text = self.time3String
        self.forecast3String = days3["conditions"] as! NSString as String
        self.forecast3Label.text = self.forecast3String
        var high3:NSDictionary = days3["high"] as! NSDictionary
        var hi3:NSString = high3["fahrenheit"] as! NSString
        self.high3String = "High: " + (hi3 as String) + "ºF"
        self.high3Label.text = self.high3String
        var low3:NSDictionary = days3["low"] as! NSDictionary
        var lo3:NSString = low3["fahrenheit"] as! NSString
        self.low3String = "Low: " + (lo3 as String) + "ºF"
        self.low3Label.text = self.low3String
        var img3:NSString = days3["icon_url"] as! NSString
        var pic3 = NSURL(string: img3 as String)
        var pic33 = NSData(contentsOfURL: pic3!)
        self.img3Label.image = UIImage(data: pic33!)
        var rainIsWeird3:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird33:NSDictionary = rainIsWeird1[6] as! NSDictionary
        var rainIsWeird333:NSString = rainIsWeird33["pop"] as! NSString
        self.precip3String = "Chance of Rain: " + (rainIsWeird333 as String) + "%"
        self.precip3Label.text = self.precip3String
        
        var days4:NSDictionary = forecastDay[4] as! NSDictionary
        var date4:NSDictionary = days4["date"] as! NSDictionary
        self.time4String = date4["weekday"] as! NSString as String
        self.time4Label.text = self.time4String
        self.forecast4String = days4["conditions"] as! NSString as String
        self.forecast4Label.text = self.forecast4String
        var high4:NSDictionary = days4["high"] as! NSDictionary
        var hi4:NSString = high4["fahrenheit"] as! NSString
        self.high4String = "High: " + (hi4 as String) + "ºF"
        self.high4Label.text = self.high4String
        var low4:NSDictionary = days4["low"] as! NSDictionary
        var lo4:NSString = low4["fahrenheit"] as! NSString
        self.low4String = "Low: " + (lo4 as String) + "ºF"
        self.low4Label.text = self.low4String
        var img4:NSString = days4["icon_url"] as! NSString
        var pic4 = NSURL(string: img4 as String)
        var pic44 = NSData(contentsOfURL: pic4!)
        self.img4Label.image = UIImage(data: pic44!)
        var rainIsWeird4:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird44:NSDictionary = rainIsWeird1[8] as! NSDictionary
        var rainIsWeird444:NSString = rainIsWeird44["pop"] as! NSString
        self.precip4String = "Chance of Rain: " + (rainIsWeird444 as String) + "%"
        self.precip4Label.text = self.precip4String
        
        var days5:NSDictionary = forecastDay[5] as! NSDictionary
        var date5:NSDictionary = days5["date"] as! NSDictionary
        self.time5String = date5["weekday"] as! NSString as String
        self.time5Label.text = self.time5String
        self.forecast5String = days5["conditions"] as! NSString as String
        self.forecast5Label.text = self.forecast5String
        var high5:NSDictionary = days5["high"] as! NSDictionary
        var hi5:NSString = high5["fahrenheit"] as! NSString
        self.high5String = "High: " + (hi5 as String) + "ºF"
        self.high5Label.text = self.high5String
        var low5:NSDictionary = days5["low"] as! NSDictionary
        var lo5:NSString = low5["fahrenheit"] as! NSString
        self.low5String = "Low: " + (lo5 as String) + "ºF"
        self.low5Label.text = self.low5String
        var img5:NSString = days5["icon_url"] as! NSString
        var pic5 = NSURL(string: img5 as String)
        var pic55 = NSData(contentsOfURL: pic5!)
        self.img5Label.image = UIImage(data: pic55!)
        var rainIsWeird5:NSArray = txtForecast["forecastday"] as! NSArray
        var rainIsWeird55:NSDictionary = rainIsWeird1[10] as! NSDictionary
        var rainIsWeird555:NSString = rainIsWeird55["pop"] as! NSString
        self.precip5String = "Chance of Rain: " + (rainIsWeird555 as String) + "%"
        self.precip5Label.text = self.precip5String

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
