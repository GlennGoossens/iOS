//
//  HomeController.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 20/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
}
