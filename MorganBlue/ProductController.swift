//
//  ProductController.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 24/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import UIKit

class ProductController: UITableViewController,UISplitViewControllerDelegate {
    
    private var model = ProductModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.products.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("productCell", forIndexPath: indexPath) as! ProductCell
        let product = model.products[indexPath.row]
        cell.titleProductCellLabel!.text = "\(product.name)"
        cell.imageProductCell!.image = UIImage(named: "\(product.image)")
        return cell
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detail = (segue.destinationViewController as! UINavigationController).topViewController as! ProductsController
        let selectedProduct = model.products[tableView.indexPathForSelectedRow!.row]
        detail.product = selectedProduct
    }
    
    override func collapseSecondaryViewController(secondaryViewController: UIViewController, forSplitViewController splitViewController: UISplitViewController) {
        
    }
    
}
