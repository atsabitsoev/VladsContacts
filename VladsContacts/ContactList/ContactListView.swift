//
//  ContactListView.swift
//  VladsContacts
//
//  Created by Ацамаз Бицоев on 25.10.2020.
//

import UIKit

final class ContactListView: UIView {
    
    private let controller: ContactListController
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private var contactCellItems: [[ContactCellItem]] = []
    
    
    init(controller: ContactListController) {
        self.controller = controller
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        setTableViewConstraints()
    }
    
    
    func configureView() {
        backgroundColor = .white
        configureTableView()
        setNeedsUpdateConstraints()
    }
    
    func setItems(_ items: [ContactCellItem]) {
        var currentLiteral = ""
        let sortedItems = items.sorted(by: {$0.displayName < $1.displayName})
        for item in sortedItems {
            let firstLiteral = String(describing: item.displayName.first)
            if firstLiteral != currentLiteral {
                currentLiteral = firstLiteral
                let newSectionArray = [item]
                contactCellItems.append(newSectionArray)
            } else {
                contactCellItems[contactCellItems.count - 1].append(item)
            }
        }
        tableView.reloadData()
    }
    
    
    private func configureTableView() {
        addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.identifier)
    }
    
}

// MARK: - Constraints
extension ContactListView {
    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - TableView
extension ContactListView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactCellItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactCellItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentItem = contactCellItems[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier) as! ContactCell
        cell.setContactName(currentItem.displayName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let currentItem = contactCellItems[section]
        let firstLetter = String(describing: currentItem.first!.displayName.first!)
        return firstLetter
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentItem = contactCellItems[indexPath.section][indexPath.row]
        controller.contactSelected(withDisplayName: currentItem.displayName)
    }
    
}
