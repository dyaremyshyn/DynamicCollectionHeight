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
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collapsedImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "plus"))
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var answerContainer: CollapsibleView = {
        let view = CollapsibleView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collapsed = true
        return view
    }()
    
    private var _collapsed: Bool = true
    private(set) var collapsed: Bool {
        get { return _collapsed }
        set {
            _collapsed = newValue
            collapsedImage.image = UIImage(named: newValue ? "plus" : "minus")
            answerContainer.collapsed = newValue
        }
    }
    
    convenience init() {
        self.init()
        addConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        addSubview(questionLabel)
        addSubview(answerContainer)
        addSubview(collapsedImage)
        
        answerContainer.addSubview(answerLabel)
        
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true

        collapsedImage.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        collapsedImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        collapsedImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        collapsedImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: collapsedImage.leadingAnchor, constant: -8).isActive = true
        
        answerContainer.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10).isActive = true
        answerContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        answerContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        let underline = UIView()
        underline.backgroundColor = .lightGray
        underline.translatesAutoresizingMaskIntoConstraints = false
        addSubview(underline)
        
        underline.topAnchor.constraint(equalTo: answerContainer.bottomAnchor, constant: 8).isActive = true
        underline.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        underline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        underline.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
        underline.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        answerLabel.topAnchor.constraint(equalTo: answerContainer.topAnchor).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: answerContainer.leadingAnchor).isActive = true
        answerLabel.trailingAnchor.constraint(equalTo: answerContainer.trailingAnchor).isActive = true
        answerLabel.bottomAnchor.constraint(equalTo: answerContainer.bottomAnchor).isActive = true
    }
    
    public func updateRow(item: FAQModel) {
        questionLabel.text = item.question
        answerLabel.text = item.answer
    }
    
    public func expandCollapseCell() {
        collapsed = !collapsed
    }
}
