//
//  City.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 26/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import Foundation

struct City {
    let name: String
    let id: Int
    
    init() {
        self.id = 0
        self.name = ""
    }
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}