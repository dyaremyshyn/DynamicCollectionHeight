//
//  CollectionViewCell.swift
//  DynamicCollectionHeight
//
//  Created by User on 19/03/2023.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    public static let cellID: String = "CollectionViewCell";
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collapsedImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var answerContainer: CollapsibleView = {
        let view = CollapsibleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collapsed = true
        return view
    }()
    
    public var collapsed: Bool {
        get { return self.collapsed }
        set {
            collapsedImage.image = UIImage(named: newValue ? "plus" : "minus")
            answerContainer.collapsed = newValue
        }
    }
    
    convenience init() {
        self.init()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        contentView.addSubview(questionLabel)
        contentView.addSubview(answerContainer)
        contentView.addSubview(collapsedImage)
        
        answerContainer.addSubview(answerLabel)
        
        collapsedImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        collapsedImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
        collapsedImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        collapsedImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: collapsedImage.leadingAnchor, constant: 8).isActive = true
        
        answerContainer.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10).isActive = true
        answerContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        answerContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
        
        let underline = UIView()
        underline.backgroundColor = .lightGray
        underline.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(underline)
        
        underline.topAnchor.constraint(equalTo: answerContainer.bottomAnchor, constant: 16).isActive = true
        underline.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        underline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
        underline.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8).isActive = true
    }
}
