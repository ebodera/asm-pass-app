//
//  EventDetailsView.swift
//  Event Scanner
//
//  Created by Ateeth Sai Kosuri on 8/21/19.
//  Copyright © 2019 American Express. All rights reserved.
//

import UIKit
import EasyPeasy

class EventDetailsView: UIView {
    
    // MARK:- View Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
//        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- View Setup
    
    func setupViewWithQRScanner() {
        self.addSubview(scanQRButton)
        self.addSubview(background)
        scanQRButton.easy.layout([Height(110), Left(25).to(self), Right(25).to(self), Bottom(35).to(self)])
        background.easy.layout([Bottom(35).to(scanQRButton, .top), Left(27).to(self), Right(27).to(self), Top(10).to(self)])
    }
    
    func setupView() {
        self.addSubview(background)
        background.easy.layout([Bottom(80).to(self), Left(27).to(self), Right(27).to(self), Top(10).to(self)])
    }
    
    // MARK:- View Elements
    
    let scanQRButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Scan QR", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        button.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.layer.shadowOffset = CGSize(width: 0, height: 6)
        button.layer.shadowRadius = 6.0
        button.layer.shadowOpacity = 0.12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5.0
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 8.0
        view.layer.shadowOpacity = 0.12
        return view
    }()

}
