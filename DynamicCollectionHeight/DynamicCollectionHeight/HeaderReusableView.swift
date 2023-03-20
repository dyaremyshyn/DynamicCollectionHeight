//
//  HeaderReusableView.swift
//  DynamicCollectionHeight
//
//  Created by User on 19/03/2023.
//

import Foundation
import UIKit

class HeaderReusableView: UICollectionReusableView {
    public static let viewID: String = "HeaderReusableView"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.numberOfLines = 0
        label.text = "This is a dynamic header"
        label.font = .boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var faqLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.numberOfLines = 0
        label.text = "Below we have dynamic cell height"
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    convenience init() {
        self.init()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(faqLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        
        faqLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25).isActive = true
        faqLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        faqLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        faqLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
    }
    
    public func updateHeaderStrings(description: String) {
        descriptionLabel.text = description
    }
}
