//
//  Person.swift
//  Contacts
//
//  Created by Михаил Иванов on 07.09.2021.
//

struct Person {
    let firstName: String
    let secondName: String
    var fullName: String {
        "\(firstName) \(secondName)"
    }

    let contact: Contacts

    static func getContacts() -> [Person] {
        var persons: [Person] = []
        let dataPerson = DataPerson()
        for name in dataPerson.firstName {
            let person = Person(
                firstName: name,
                secondName: dataPerson.secondName.randomElement() ?? "",
                contact: Contacts(
                    numberPhone: dataPerson.numberPhone.randomElement() ?? "",
                    mail: dataPerson.mail.randomElement() ?? ""
                )
            )
            persons.append(person)
        }

        return persons
    }
}

struct Contacts {
    let numberPhone: String
    let mail: String
}
