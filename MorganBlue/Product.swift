//
//  Product.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 24/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import UIKit

struct Product {
    let name: String
    let omschrijving: String
    let handleiding: String
    let image: String
    
    init(name: String,omschrijving: String,handleiding: String, image: String ) {
        self.name = name
        self.omschrijving = omschrijving
        self.handleiding = handleiding
        self.image = image
    }
    
}
