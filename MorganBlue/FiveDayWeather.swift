//
//  FiveDayWeather.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 26/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import Foundation

class FiveDayWeather {
    var week :[DayWeather]
    var location: String
    
    init(){
        self.week = []
        self.location = ""
    }
    
    init(week: [DayWeather],location: String){
        self.week = week
        self.location = location
    }
}