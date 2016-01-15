//
//  ProductsController.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 24/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import UIKit

//detail van de products weergeven
class ProductsController: UIViewController {
    
    var product: Product!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productView: UIImageView!
    @IBOutlet weak var handleidingLabel: UILabel!
    @IBOutlet weak var beschrijvingLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel!.text = "\(product.name)"
        productView!.image = UIImage(named: "\(product.image)")
        handleidingLabel!.text = "\(product.handleiding)"
        beschrijvingLabel!.text = "\(product.omschrijving)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //iphone plus fix
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        if !splitViewController!.collapsed {
            navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem()
        }
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
