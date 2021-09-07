//
//  PersonViewController.swift
//  Contacts
//
//  Created by Михаил Иванов on 07.09.2021.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet var numberPhoneLabel: UILabel!
    @IBOutlet var mailLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = person.fullName
        numberPhoneLabel.text = "Number Phone: \(person.contact.numberPhone)"
        mailLabel.text = "Mail: \(person.contact.mail)"
    }
    
}
