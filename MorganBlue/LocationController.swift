//
//  LocationController.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 26/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import UIKit

class LocationController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    private var data = CountryData()
    private var city: (name: String,id: Int)!
    var cities = [String]()
    
    @IBOutlet weak var succesLabel: UILabel!
    
    @IBOutlet weak var cityPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityPicker.delegate = self
        cityPicker.dataSource = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        vulCities()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //insert pickerview + selected saven
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
    return cities.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cityInPicker:String = cities[row]
        if cityInPicker != "" {
            print(cityInPicker)
        } else {
            city = (name : "London",id: 2643743)
        }
    }
    
    
    @IBAction func save() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(city.id, forKey: defaultsKeys.cityKey)
        print(city)
    }
    
    func vulCities() {
        for (name,id) in data.data {
            cities.append(name)
            print(id)
        }
    }
}


