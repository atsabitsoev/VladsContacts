//
//  ContactInfoView.swift
//  VladsContacts
//
//  Created by Ацамаз Бицоев on 25.10.2020.
//

import UIKit
import SDWebImage

final class ContactInfoView: UIView {
    
    private let controller: ContactInfoController
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    
    init(controller: ContactInfoController) {
        self.controller = controller
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setPhotoImageViewConstraints()
        super.updateConstraints()
    }
    
    
    func configureView() {
        backgroundColor = .white
        addSubview(photoImageView)
        setNeedsUpdateConstraints()
    }
    
    func setImage(withUrl url: String) {
        let url = URL(string: url)
        photoImageView.sd_setImage(with: url, completed: nil)
    }
    
}

// MARK: - Constraints
extension ContactInfoView {
    private func setPhotoImageViewConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 200),
            photoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
