//
//  CollapsibleView.swift
//  DynamicCollectionHeight
//
//  Created by User on 19/03/2023.
//

import Foundation
import UIKit

class CollapsibleView: UIView {
    
    private var heightConstraint: NSLayoutConstraint
    public var collapsed: Bool {
        get { heightConstraint.isActive }
        set { heightConstraint.isActive = newValue }
    }

    convenience init() {
        self.init()
        setHeightConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHeightConstraint() {
        clipsToBounds = true
        heightConstraint = self.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.priority = .required
        self.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(heightConstraint)
        heightConstraint.isActive = false
    }
}
