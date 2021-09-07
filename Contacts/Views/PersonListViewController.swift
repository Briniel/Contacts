//
//  PersonListViewController.swift
//  Contacts
//
//  Created by Михаил Иванов on 07.09.2021.
//

import UIKit

class PersonListViewController: UITableViewController {
    private var persons = Person.getContacts()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactID", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = persons[indexPath.row]

        content.text = person.fullName

        cell.contentConfiguration = content
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personVC = segue.destination as? PersonViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else {
            return
        }

        personVC.person = persons[index.row]
    }
}

// MARK: - TabBarDelegate

extension PersonListViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navigationController = viewController as? UINavigationController else {
            return
        }
        if let fullPersonListVC = navigationController.visibleViewController as? FullPersonListViewController {
            fullPersonListVC.persons = persons
        }
    }
}
