//
//  EventDashboardCell.swift
//  Event Scanner
//
//  Created by Ateeth Sai Kosuri on 8/21/19.
//  Copyright © 2019 American Express. All rights reserved.
//

import UIKit
import EasyPeasy

class EventDashboardCell: UITableViewCell {
    
    // MARK:- Table View Cell Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.backgroundColor = .clear
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- View Setup
    
    func setupView() {
        contentView.addSubview(background)
        contentView.addSubview(eventImage)
        contentView.addSubview(eventNameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(timeIcon)
        contentView.addSubview(locationLabel)
        contentView.addSubview(locationIcon)
        contentView.addSubview(statusIcon)
        background.easy.layout([Height(240), Left(25).to(contentView), Right(25).to(contentView), Top(10).to(contentView), Bottom(10).to(contentView)])
        eventImage.easy.layout([Height(130), Left().to(background, .left), Right().to(background, .right), Top().to(background, .top)])
        eventNameLabel.easy.layout([Top(15).to(eventImage, .bottom), Left(20).to(background, .left), Right(20).to(background, .right)])
        timeLabel.easy.layout([Top(6).to(eventNameLabel, .bottom), Left(25).to(eventNameLabel, .left), Right(20).to(background, .right)])
        timeIcon.easy.layout([CenterY().to(timeLabel), Left(20).to(background, .left)])
        locationLabel.easy.layout([Top(6).to(timeLabel, .bottom), Left(25).to(eventNameLabel, .left), Right(20).to(background, .right)])
        locationIcon.easy.layout([CenterY().to(locationLabel), Left(21).to(background, .left)])
        statusIcon.easy.layout([Top(15).to(background, .top), Right(15).to(background, .right)])
    }
    
    // MARK:- View Elements
    
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
        image.image = UIImage(named: "Image1")?.withRenderingMode(.alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        return image
    }()
    
    var eventNameLabel: UILabel = {
        let label = UILabel()
        label.text = "One Amex Workshop"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        label.textColor = darkGrayText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ClockIcon")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "August 4th • 4PM-7PM"
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        label.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "LocationIcon")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "AEDR OB1"
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        label.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "AddEventIcon")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
}
