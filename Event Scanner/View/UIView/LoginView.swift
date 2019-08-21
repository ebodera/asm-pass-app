//
//  LoginView.swift
//  Event Scanner
//
//  Created by Ateeth Sai Kosuri on 8/21/19.
//  Copyright © 2019 American Express. All rights reserved.
//

import UIKit

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = primaryBlue
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- View Setup
    
    private func setupView() {
        
    }
    
    // MARK:- View Elements
    
    private let primaryHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "PASS"
        label.font = UIFont.systemFont(ofSize: 60.0, weight: UIFont.Weight.black)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
