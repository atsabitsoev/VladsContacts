//
//  ContactListController.swift
//  VladsContacts
//
//  Created by Ацамаз Бицоев on 25.10.2020.
//

import UIKit

final class ContactListController: UIViewController {
    
    private var contactListView: ContactListView!
    
    private let contacts: [Contact] = [
        Contact(
            name: "Андрей",
            lastname: "Скоробогатько",
            phoneNumber: "+79284983000",
            imageUrl: "https://www.lotlike.ru/upload/iblock/ebc/sale_25_fridom_01.jpg"
        ),
        Contact(
            name: "Ацамаз",
            lastname: "Бицоев",
            phoneNumber: "+794674810238947",
            imageUrl: "https://cdn.bfm.ru/news/photopreviewextralarge/2019/10/31/cat.jpg"
        ),
        Contact(
            name: "Петр",
            lastname: "Иванов",
            phoneNumber: "+79284983000",
            imageUrl: "https://www.lotlike.ru/upload/iblock/ebc/sale_25_fridom_01.jpg"
        ),
        Contact(
            name: "Иван",
            lastname: "Петров",
            phoneNumber: "+79284983000",
            imageUrl: "https://www.lotlike.ru/upload/iblock/ebc/sale_25_fridom_01.jpg"
        ),Contact(
            name: "Говно",
            lastname: "Собачье",
            phoneNumber: "+79284983000",
            imageUrl: "https://www.lotlike.ru/upload/iblock/ebc/sale_25_fridom_01.jpg"
        ),
        Contact(
            name: "Тадей",
            lastname: "Вагонов",
            phoneNumber: "+79284983000",
            imageUrl: "https://www.lotlike.ru/upload/iblock/ebc/sale_25_fridom_01.jpg"
        ),
        Contact(
            name: "Вагон",
            lastname: "Отходов",
            phoneNumber: "+79284983000",
            imageUrl: "https://www.lotlike.ru/upload/iblock/ebc/sale_25_fridom_01.jpg"
        ),
        Contact(
            name: "Корзина",
            lastname: "Ильина",
            phoneNumber: "+79284983000",
            imageUrl: "https://www.lotlike.ru/upload/iblock/ebc/sale_25_fridom_01.jpg"
        ),
        Contact(
            name: "Машина",
            lastname: "Продуктов",
            phoneNumber: "+79284983000",
            imageUrl: "https://www.lotlike.ru/upload/iblock/ebc/sale_25_fridom_01.jpg"
        ),
    ]
    
    
    override func loadView() {
        super.loadView()
        contactListView = ContactListView(controller: self)
        view = contactListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Контакты"
        navigationController?.navigationBar.prefersLargeTitles = true
        contactListView.configureView()
        
        var contactCellItems: [ContactCellItem] = []
        for contact in contacts {
            let item = contactToItem(contact)
            contactCellItems.append(item)
        }
        contactListView.setItems(contactCellItems)
    }
    
    
    func contactSelected(withDisplayName name: String) {
        for contact in contacts {
            if "\(contact.name) \(contact.lastname)" == name {
                showContactInfo(with: contact)
            }
        }
    }
    
    
    private func showContactInfo(with contact: Contact) {
        let contactInfoController = ContactInfoController(contact: contact)
        navigationController?.show(contactInfoController, sender: nil)
    }
    
    private func contactToItem(_ contact: Contact) -> ContactCellItem {
        let name = contact.name
        let lastname = contact.lastname
        let displayName = "\(name) \(lastname)"
        return ContactCellItem(displayName: displayName)
    }
    
}
