//
//  AboutContactController.swift
//  MorganBlue
//
//  Created by Glenn Goossens on 20/12/15.
//  Copyright © 2015 Glenn Goossens. All rights reserved.
//

import UIKit

class AboutContactController: UIViewController {
    
    private var model = AboutContact(about: "Over ons...", contact: Contact(name: "Kurt Tembuyser",telephone: 0123456789,email: "kurt@morganblue.net",adress: Adress(street: "Vlamingveld",number: 55,zipcode: 5000, city: "Jabbeke")))
    
    @IBOutlet weak var aboutLabel: UILabel!
    
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactTeleLabel: UILabel!
    
    @IBOutlet weak var adressStreetLabel: UILabel!
    @IBOutlet weak var adressNumberLabel: UILabel!
    @IBOutlet weak var adressZipLabel: UILabel!
    @IBOutlet weak var adressCityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutLabel.text = model.about
        
        contactNameLabel.text = model.contact.name
        contactTeleLabel.text = String(model.contact.telephone)
        
        adressStreetLabel.text = model.contact.adress.street
        adressNumberLabel.text = String(model.contact.adress.number)
        adressZipLabel.text = String(model.contact.adress.zipcode)
        adressCityLabel.text = model.contact.adress.city
        
    }
}

