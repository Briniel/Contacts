//
//  FullPersonListViewController.swift
//  Contacts
//
//  Created by Михаил Иванов on 07.09.2021.
//

import UIKit

class FullPersonListViewController: UITableViewController {
    var persons: [Person]!

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        var content = header.defaultContentConfiguration()
        
        content.text = "\(persons[section].fullName)"
        header.contentConfiguration = content
        
        return header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fullContactID", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        if indexPath.row == 0 {
            content.image = UIImage(systemName: "envelope.fill")
            content.text = "\(persons[indexPath.section].contact.mail)"
        } else {
            content.image = UIImage(systemName: "phone")
            content.text = "\(persons[indexPath.section].contact.numberPhone)"
        }
        
        cell.contentConfiguration = content
        return cell
    }
}
