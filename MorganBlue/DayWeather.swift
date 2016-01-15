//
//  DayWeather.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 26/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import Foundation

class DayWeather {
    let rainData:[(eerste:Double,tweede:NSDate)]
    let degreeData:[(eerste:Double,tweede:NSDate)]
    let windData: [(eerste:Double,tweede:NSDate)]
    let dateString: NSDate
    
    init(rainData: [(eerste:Double,tweede:NSDate)],degreeData:[(eerste:Double,tweede:NSDate)],windData:[(eerste:Double,tweede:NSDate)],date: NSDate){
        self.degreeData = degreeData
        self.rainData = rainData
        self.windData = windData
        self.dateString = date
    }
}