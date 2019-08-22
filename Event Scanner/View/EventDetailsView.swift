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
        setupEventDetails()
    }
    
    func setupView() {
        self.addSubview(background)
        background.easy.layout([Bottom(80).to(self), Left(27).to(self), Right(27).to(self), Top(10).to(self)])
        setupEventDetails()
    }
    
    func setupEventDetails() {
        self.addSubview(eventImage)
        self.addSubview(eventNameField)
        self.addSubview(timeLabel)
        self.addSubview(timeIcon)
        self.addSubview(locationLabel)
        self.addSubview(locationIcon)
        self.addSubview(peopleLabel)
        self.addSubview(peopleIcon)
        self.addSubview(descriptionLabel)
        eventImage.easy.layout([Height(165), Top().to(background, .top), Left().to(background, .left), Right().to(background, .right)])
        eventNameField.easy.layout([Top(15).to(eventImage, .bottom), Left(20).to(background, .left), Right(20).to(background, .right)])
        timeLabel.easy.layout([Top(6).to(eventNameField, .bottom), Left(25).to(eventNameField, .left), Right(20).to(background, .right)])
        timeIcon.easy.layout([CenterY().to(timeLabel), Left(20).to(background, .left)])
        locationLabel.easy.layout([Top(6).to(timeLabel, .bottom), Left(25).to(eventNameField, .left), Right(20).to(background, .right)])
        locationIcon.easy.layout([CenterY().to(locationLabel), Left(21).to(background, .left)])
        peopleLabel.easy.layout([Top(6).to(locationLabel, .bottom), Left(25).to(eventNameField, .left), Right(20).to(background, .right)])
        peopleIcon.easy.layout([CenterY().to(peopleLabel), Left(20).to(background, .left)])
        descriptionLabel.easy.layout([Top(8).to(peopleLabel, .bottom), Left(18).to(background, .left), Right(18).to(background, .right), Bottom(20).to(background, .bottom)])
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
    
    var eventImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        return image
    }()
    
    let eventNameField: UITextField = {
        let field = UITextField()
        field.text = "One Amex Workshop"
        field.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        field.textColor = darkGrayText
        field.isEnabled = false
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let timeIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ClockIcon")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let timeLabel: UITextField = {
        let label = UITextField()
        label.text = "August 4th • 4PM-7PM"
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        label.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
        label.isEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "LocationIcon")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let locationLabel: UITextField = {
        let label = UITextField()
        label.text = "AEDR OB1"
        label.isEnabled = false
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        label.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let peopleIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "PeopleIcon")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let peopleLabel: UITextField = {
        let label = UITextField()
        label.text = "42"
        label.isEnabled = false
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        label.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UITextView = {
        let label = UITextView()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.isEditable = false
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light)
        label.textColor = darkGrayText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
