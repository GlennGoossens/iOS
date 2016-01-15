//
//  DetailViewController.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 24/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import UIKit

class EmptyDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func viewDidAppear(animated: Bool) {
        if splitViewController!.displayMode == .PrimaryHidden {
            let target = splitViewController!.displayModeButtonItem().target
            let action = splitViewController!.displayModeButtonItem().action
            target!.performSelector(action)
        }
    }

    
    
}
