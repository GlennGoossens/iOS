//
//  WeatherController.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 26/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WeatherController: UITableViewController {
    
    //var currentTask: NSURLSessionTask?
    var location: String = ""
    var fiveDayWeather: FiveDayWeather = FiveDayWeather()
    var temps = [(eerste:Double,tweede:String)]()
    var rains = [(eerste:Double,tweede:String)]()
    var winds = [(eerste:Double,tweede:String)]()

    
    //get data
    func getWeerData(url: String) {
//        let url = NSURL(string: url)
//        
//        currentTask = NSURLSession.sharedSession().dataTaskWithURL(url!) {
//            (data,response,error) in
//            dispatch_async(dispatch_get_main_queue(), {
//                self.setLabels(data!)
//            })
//        }
//        
//        currentTask?.resume()
        request(.GET, url).validate().responseJSON
            { response in
                switch response.result {
                case .Success:
                let weatherJSON = JSON(response.result.value!)
                self.location = weatherJSON["city"]["name"].stringValue
                //["list"] array maken en invullen
                for item in weatherJSON["list"].arrayValue {
                    let date = item["dt_text"].stringValue
                    self.temps.append((item["main"]["temp"].doubleValue,date))
                    self.winds.append((item["wind"]["speed"].doubleValue,date))
                    if item["rain"].error == nil {
                    self.rains.append((item["rain"].doubleValue,date))
                    } else {
                    self.rains.append((0.0,date))
                    }
                }
                
            self.setWeatherWeek()
                self.tableView.reloadData()
                case .Failure(let error):
                NSLog("Error : \(error)")
            }
        }
    }
    
    //set labels, get data uit json in labels
    //func setLabels(data: NSData){
//        let json = JSON(data: data)
//        
//        fiveDayWeather!.location = json["city"]["name"].stringValue
//        
//        for (_,data) in json["list"].dictionaryValue {
//            //if let temp = data["main.temp"] {
//              //  if let  date = data["dt_text"] {
//            let temp = data["main"]["temp"].doubleValue
//            let date = data["dt_text"].stringValue
//                temps.append((temp ,date ))
//             //   }
//            //}
//            //if let wind = data["wind.speed"]  {
//              //  if let date = data["dt_text"]{
//            let wind = data["wind"]["speed"].doubleValue
//                winds.append((wind ,date ))
//            //    }
//            //}
//            //if var rain = data["rain"] {
//            //    if let date = data["dt_text"] {
//             let rain = data["rain"].doubleValue
//        
//                rains.append((rain,date))
//                 //   }
//           // }
//        }
      //  setWeatherWeek()
        
        
    //}
    
    //temp,wind,rain array omzetten naar de arrays in FiveDayWeather
    func setWeatherWeek() {
        // overlopen tuples,vandaag +5dagen in array zetten,string omzetten naar date, data in array zetten nieuw object dayweather
        let regenMetDate = omzettenStringtoNSDate(rains)
        let tempMetDate = omzettenStringtoNSDate(temps)
        let windMetDate = omzettenStringtoNSDate(winds)
        let vandaag = NSDate()
        var rainsDayO = [(eerste:Double,tweede:NSDate)]()
        var rainsDay1 = [(eerste:Double,tweede:NSDate)]()
        var rainsDay2 = [(eerste:Double,tweede:NSDate)]()
        var rainsDay3 = [(eerste:Double,tweede:NSDate)]()
        var rainsDay4 = [(eerste:Double,tweede:NSDate)]()
        var tempsDayO = [(eerste:Double,tweede:NSDate)]()
        var tempsDay1 = [(eerste:Double,tweede:NSDate)]()
        var tempsDay2 = [(eerste:Double,tweede:NSDate)]()
        var tempsDay3 = [(eerste:Double,tweede:NSDate)]()
        var tempsDay4 = [(eerste:Double,tweede:NSDate)]()
        var windsDayO = [(eerste:Double,tweede:NSDate)]()
        var windsDay1 = [(eerste:Double,tweede:NSDate)]()
        var windsDay2 = [(eerste:Double,tweede:NSDate)]()
        var windsDay3 = [(eerste:Double,tweede:NSDate)]()
        var windsDay4 = [(eerste:Double,tweede:NSDate)]()
        let calender = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        //array per dag vullen, soort stack maken
        for array in regenMetDate{
            if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag) {
                //omzetten van fahrenheit naar celcius
                rainsDayO.append(((array.eerste  -  273.15),array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60)){
                rainsDay1.append(((array.eerste  -  273.15),array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*2)){
                rainsDay2.append(((array.eerste  -  273.15),array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*3)){
                rainsDay3.append(((array.eerste  -  273.15),array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*4)){
                rainsDay4.append(((array.eerste  -  273.15),array.tweede))
            }
        }
        for array in tempMetDate{
            if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag) {
                tempsDayO.append((array.eerste,array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60)){
                tempsDay1.append((array.eerste,array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*2)){
                tempsDay2.append((array.eerste,array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*3)){
                tempsDay3.append((array.eerste,array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*4)){
                tempsDay4.append((array.eerste,array.tweede))
            }
        }
        for array in windMetDate{
            if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag) {
                windsDayO.append((array.eerste,array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60)){
                windsDay1.append((array.eerste,array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*2)){
                windsDay2.append((array.eerste,array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*3)){
                windsDay3.append((array.eerste,array.tweede))
            }else if calender.components(.Day, fromDate: array.tweede) == calender.components(.Day, fromDate: vandaag.dateByAddingTimeInterval(24*60*60*4)){
                windsDay4.append((array.eerste,array.tweede))
            }
        }
        //FiveDayWeather opvullen
        var array = [DayWeather]()
        
        array.insert(DayWeather(rainData: rainsDayO, degreeData: tempsDayO, windData: windsDayO, date: vandaag), atIndex: 0)
        array.insert(DayWeather(rainData: rainsDay1, degreeData: tempsDay1, windData: windsDay1, date: vandaag.dateByAddingTimeInterval(24*60*60)), atIndex: 1)
        array.insert(DayWeather(rainData: rainsDay2, degreeData: tempsDay2, windData: windsDay2, date: vandaag.dateByAddingTimeInterval(24*60*60*2)), atIndex: 2)
        array.insert(DayWeather(rainData: rainsDay3, degreeData: tempsDay3, windData: windsDay3, date: vandaag.dateByAddingTimeInterval(24*60*60*3)), atIndex: 3)
        array.insert(DayWeather(rainData: rainsDay4, degreeData: tempsDay4, windData: windsDay4, date: vandaag.dateByAddingTimeInterval(24*60*60*4)), atIndex: 4)
        fiveDayWeather = FiveDayWeather(week: array, location: location)
    }
    
    func omzettenStringtoNSDate(array : [(eerste:Double,tweede:String)]) -> [(eerste:Double,tweede:NSDate)]{
        var arrayMetDate = [(eerste:Double,tweede:NSDate)]()
        let dateFormatter = NSDateFormatter()
        for dag in array {
        dateFormatter.dateFormat = "yyy-mm-dd HH:mm:ss" //2015-12-27 18:00:00
        let date = dateFormatter.dateFromString(dag.tweede)
            arrayMetDate.append((eerste: dag.eerste,tweede: date!))
        }
        return arrayMetDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = NSUserDefaults.standardUserDefaults()
        //getWeerData("http://api.openweathermap.org/data/2.5/forecast?id="+"\(defaultsKeys.cityKey)"+"&appid=2de143494c0b295cca9337e1e96b00e0")
        getWeerData("http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=2de143494c0b295cca9337e1e96b00e0")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("weatherCell", forIndexPath: indexPath) as! WeatherCell
        

        // Configure the cell...
        //TODO
        let weather = fiveDayWeather.week[indexPath.row]
        cell.locatioLabel.text = fiveDayWeather.location
        cell.dayLabel.text = "\(weather.dateString)"
        cell.degreeLabel.text = berekenGemiddelde(weather.degreeData)
        cell.rainLabel.text = berekenGemiddelde(weather.rainData)
        cell.bestHoursLabel.text = "test"
        return cell
        //dayLabel: UILabel!
        //@IBOutlet weak var locatioLabel: UILabel!
        //@IBOutlet weak var degreeLabel: UILabel!
        //@IBOutlet weak var rainLabel: UILabel!
        //@IBOutlet weak var bestHoursLabel: UILabel!

        
    }

    func berekenGemiddelde(array : [(eerste:Double,tweede:NSDate)]) -> String {
        var totaal = Double()
        
        for data in array {
            totaal += data.eerste
        }
        let arraylengteDouble = Double(array.count)
        let gemiddelde = totaal / arraylengteDouble
        return "\(gemiddelde)"
    }
    
    func berekenBesteTrainingsUren(weatherdata: DayWeather) -> String {
        
        
        
        return ""
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
