//
//  HourlyWeatherClass.swift
//  Accessible App
//
//  Created by Saqlain Golandaz on 9/9/15.
//  Copyright (c) 2015 SaqlainGolandaz. All rights reserved.
//

import UIKit

class HourlyWeatherClass: UIViewController {
    
    
    @IBOutlet weak var time1Label: UILabel!
    @IBOutlet weak var forecast1Label: UILabel!
    @IBOutlet weak var temp1Label: UILabel!
    @IBOutlet weak var precip1Label: UILabel!
    @IBOutlet weak var img1Label: UIImageView!
    
    @IBOutlet weak var time2Label: UILabel!
    @IBOutlet weak var forecast2Label: UILabel!
    @IBOutlet weak var temp2Label: UILabel!
    @IBOutlet weak var precip2Label: UILabel!
    @IBOutlet weak var img2Label: UIImageView!
    
    @IBOutlet weak var time3Label: UILabel!
    @IBOutlet weak var forecast3Label: UILabel!
    @IBOutlet weak var temp3Label: UILabel!
    @IBOutlet weak var precip3Label: UILabel!
    @IBOutlet weak var img3Label: UIImageView!
    
    @IBOutlet weak var time4Label: UILabel!
    @IBOutlet weak var forecast4Label: UILabel!
    @IBOutlet weak var temp4Label: UILabel!
    @IBOutlet weak var precip4Label: UILabel!
    @IBOutlet weak var img4Label: UIImageView!
    
    @IBOutlet weak var time5Label: UILabel!
    @IBOutlet weak var forecast5Label: UILabel!
    @IBOutlet weak var temp5Label: UILabel!
    @IBOutlet weak var precip5Label: UILabel!
    @IBOutlet weak var img5Label: UIImageView!
    
    @IBOutlet weak var time6Label: UILabel!
    @IBOutlet weak var forecast6Label: UILabel!
    @IBOutlet weak var temp6Label: UILabel!
    @IBOutlet weak var precip6Label: UILabel!
    @IBOutlet weak var img6Label: UIImageView!
    
    
    
    
    
    var time1String:String = ""
    var forecast1String:String = ""
    var temp1String:String = ""
    var precip1String:String = ""
    var img1String:String = ""
    
    var time2String:String = ""
    var forecast2String:String = ""
    var temp2String:String = ""
    var precip2String:String = ""
    var img2String:String = ""
    
    var time3String:String = ""
    var forecast3String:String = ""
    var temp3String:String = ""
    var precip3String:String = ""
    var img3String:String = ""
    
    var time4String:String = ""
    var forecast4String:String = ""
    var temp4String:String = ""
    var precip4String:String = ""
    var img4String:String = ""
    
    var time5String:String = ""
    var forecast5String:String = ""
    var temp5String:String = ""
    var precip5String:String = ""
    var img5String:String = ""
    
    var time6String:String = ""
    var forecast6String:String = ""
    var temp6String:String = ""
    var precip6String:String = ""
    var img6String:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hourlyData()
    }
    
    func hourlyData() {
        let url = NSURL(string:"https://api.wunderground.com/api/16337742f9b11efe/hourly/q/autoip.json")
        let returnedData = NSData(contentsOfURL: url!)
        
        var parsedData:NSDictionary = [:]
        
        do {
        parsedData = try NSJSONSerialization.JSONObjectWithData(returnedData!, options: NSJSONReadingOptions.MutableContainers)as! NSDictionary
        } catch let error as NSError {
        // Catch fires here, with an NSErrro being thrown from the JSONObjectWithData method
        print("A JSON parsing error occurred, here are the details:\n \(error)")
        }
        
        var main:NSArray = parsedData["hourly_forecast"] as! NSArray
        
        var firstTime:NSDictionary = main[0]["FCTTIME"] as! NSDictionary
        var time1:NSString = firstTime["civil"] as! NSString
        self.time1String = time1 as String
        self.time1Label.text = self.time1String
        var firstForecast: NSDictionary = main[0] as! NSDictionary
        var forecast1:NSString = firstForecast["condition"] as! NSString
        self.forecast1String = forecast1 as String
        self.forecast1Label.text = self.forecast1String
        var firstTemp:NSDictionary = main[0]["temp"] as! NSDictionary
        var temp1:NSString = firstTemp["english"] as! NSString
        self.temp1String = "Temperature: " + (temp1 as String) + "ºF"
        self.temp1Label.text = self.temp1String
        var firstPrecip:NSDictionary = main[0] as! NSDictionary
        var precip1:NSString = firstPrecip["pop"] as! NSString
        self.precip1String = "Chance of Rain: " + (precip1 as String) + "%"
        self.precip1Label.text = self.precip1String
        var firstIMG:NSDictionary = main[0] as! NSDictionary
        var img1:NSString = firstIMG["icon_url"] as! NSString
        var pic1 = NSURL(string: img1 as String)
        var pic11 = NSData(contentsOfURL: pic1!)
        self.img1Label.image = UIImage(data: pic11!)
        
        var secondTime:NSDictionary = main[1]["FCTTIME"] as! NSDictionary
        var time2:NSString = secondTime["civil"] as! NSString
        self.time2String = time2 as String
        self.time2Label.text = self.time2String
        var secondForecast: NSDictionary = main[1] as! NSDictionary
        var forecast2:NSString = secondForecast["condition"] as! NSString
        self.forecast2String = forecast2 as String
        self.forecast2Label.text = self.forecast2String
        var secondTemp:NSDictionary = main[1]["temp"] as! NSDictionary
        var temp2:NSString = secondTemp["english"] as! NSString
        self.temp2String = "Temperature: " + (temp2 as String) + "ºF"
        self.temp2Label.text = self.temp2String
        var secondPrecip:NSDictionary = main[1] as! NSDictionary
        var precip2:NSString = secondPrecip["pop"] as! NSString
        self.precip2String = "Chance of Rain: " + (precip2 as String) + "%"
        self.precip2Label.text = self.precip2String
        var secondIMG:NSDictionary = main[1] as! NSDictionary
        var img2:NSString = secondIMG["icon_url"] as! NSString
        var pic2 = NSURL(string: img2 as String)
        var pic22 = NSData(contentsOfURL: pic2!)
        self.img2Label.image = UIImage(data: pic22!)
        
        var thirdTime:NSDictionary = main[2]["FCTTIME"] as! NSDictionary
        var time3:NSString = thirdTime["civil"] as! NSString
        self.time3String = time3 as String
        self.time3Label.text = self.time3String
        var thirdForecast: NSDictionary = main[2] as! NSDictionary
        var forecast3:NSString = thirdForecast["condition"] as! NSString
        self.forecast3String = forecast3 as String
        self.forecast3Label.text = self.forecast3String
        var thirdTemp:NSDictionary = main[2]["temp"] as! NSDictionary
        var temp3:NSString = thirdTemp["english"] as! NSString
        self.temp3String = "Temperature: " + (temp3 as String) + "ºF"
        self.temp3Label.text = self.temp3String
        var thirdPrecip:NSDictionary = main[2] as! NSDictionary
        var precip3:NSString = thirdPrecip["pop"] as! NSString
        self.precip3String = "Chance of Rain: " + (precip3 as String) + "%"
        self.precip3Label.text = self.precip3String
        var thirdIMG:NSDictionary = main[2] as! NSDictionary
        var img3:NSString = thirdIMG["icon_url"] as! NSString
        var pic3 = NSURL(string: img3 as String)
        var pic33 = NSData(contentsOfURL: pic3!)
        self.img3Label.image = UIImage(data: pic33!)
        
        var fourthTime:NSDictionary = main[3]["FCTTIME"] as! NSDictionary
        var time4:NSString = fourthTime["civil"] as! NSString
        self.time4String = time4 as String
        self.time4Label.text = self.time4String
        var fourthForecast: NSDictionary = main[3] as! NSDictionary
        var forecast4:NSString = fourthForecast["condition"] as! NSString
        self.forecast4String = forecast4 as String
        self.forecast4Label.text = self.forecast4String
        var fourthTemp:NSDictionary = main[3]["temp"] as! NSDictionary
        var temp4:NSString = fourthTemp["english"] as! NSString
        self.temp4String = "Temperature: " + (temp4 as String) + "ºF"
        self.temp4Label.text = self.temp4String
        var fourthPrecip:NSDictionary = main[3] as! NSDictionary
        var precip4:NSString = fourthPrecip["pop"] as! NSString
        self.precip4String = "Chance of Rain: " + (precip4 as String) + "%"
        self.precip4Label.text = self.precip4String
        var fourthIMG:NSDictionary = main[3] as! NSDictionary
        var img4:NSString = fourthIMG["icon_url"] as! NSString
        var pic4 = NSURL(string: img4 as String)
        var pic44 = NSData(contentsOfURL: pic4!)
        self.img4Label.image = UIImage(data: pic44!)
        
        var fifthTime:NSDictionary = main[4]["FCTTIME"] as! NSDictionary
        var time5:NSString = fifthTime["civil"] as! NSString
        self.time5String = time5 as String
        self.time5Label.text = self.time5String
        var fifthForecast: NSDictionary = main[4] as! NSDictionary
        var forecast5:NSString = fifthForecast["condition"] as! NSString
        self.forecast5String = forecast5 as String
        self.forecast5Label.text = self.forecast5String
        var fifthTemp:NSDictionary = main[4]["temp"] as! NSDictionary
        var temp5:NSString = fifthTemp["english"] as! NSString
        self.temp5String = "Temperature: " + (temp5 as String) + "ºF"
        self.temp5Label.text = self.temp5String
        var fifthPrecip:NSDictionary = main[4] as! NSDictionary
        var precip5:NSString = fifthPrecip["pop"] as! NSString
        self.precip5String = "Chance of Rain: " + (precip5 as String) + "%"
        self.precip5Label.text = self.precip5String
        var fifthIMG:NSDictionary = main[4] as! NSDictionary
        var img5:NSString = fifthIMG["icon_url"] as! NSString
        var pic5 = NSURL(string: img5 as String)
        var pic55 = NSData(contentsOfURL: pic5!)
        self.img5Label.image = UIImage(data: pic55!)
        
        var sixthTime:NSDictionary = main[5]["FCTTIME"] as! NSDictionary
        var time6:NSString = sixthTime["civil"] as! NSString
        self.time6String = time6 as String
        self.time6Label.text = self.time6String
        var sixthForecast: NSDictionary = main[5] as! NSDictionary
        var forecast6:NSString = sixthForecast["condition"] as! NSString
        self.forecast6String = forecast6 as String
        self.forecast6Label.text = self.forecast6String
        var sixthTemp:NSDictionary = main[5]["temp"] as! NSDictionary
        var temp6:NSString = sixthTemp["english"] as! NSString
        self.temp6String = "Temperature: " + (temp6 as String) + "ºF"
        self.temp6Label.text = self.temp6String
        var sixthPrecip:NSDictionary = main[5] as! NSDictionary
        var precip6:NSString = sixthPrecip["pop"] as! NSString
        self.precip6String = "Chance of Rain: " + (precip6 as String) + "%"
        self.precip6Label.text = self.precip6String
        var sixthIMG:NSDictionary = main[5] as! NSDictionary
        var img6:NSString = sixthIMG["icon_url"] as! NSString
        var pic6 = NSURL(string: img6 as String)
        var pic66 = NSData(contentsOfURL: pic6!)
        self.img6Label.image = UIImage(data: pic66!)
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
