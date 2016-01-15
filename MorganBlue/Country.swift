//
//  Country.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 26/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import Foundation

struct Country {
    let name: String
    let cities:[City]
    
    init(name: String, data: [City]) {
        self.name = name
        self.cities = data
    }
}