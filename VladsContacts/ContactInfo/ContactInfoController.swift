//
//  ContactInfoController.swift
//  VladsContacts
//
//  Created by Ацамаз Бицоев on 25.10.2020.
//

import UIKit

final class ContactInfoController: UIViewController {
    
    private var contactInfoView: ContactInfoView!
    
    private let contact: Contact
    
    
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        contactInfoView = ContactInfoView(controller: self)
        view = contactInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = contact.name
        contactInfoView.configureView()
        contactInfoView.setImage(withUrl: contact.imageUrl)
        navigationItem.largeTitleDisplayMode = .never
    }
}
