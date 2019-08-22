//
//  QRView.swift
//  Event Scanner
//
//  Created by Ateeth Sai Kosuri on 8/21/19.
//  Copyright © 2019 American Express. All rights reserved.
//

import UIKit
import EasyPeasy

class QRView: UIView {
    
    // MARK:- View Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- View Setup
    
    func setupView() {
        self.addSubview(qrCodeImage)
        qrCodeImage.easy.layout([Top(20).to(self), Left(25).to(self), Right(25).to(self), Bottom(20).to(self), Height(270), Width(270)])
    }
    
    // MARK:- View Elements
    
    let qrCodeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10.0
        image.clipsToBounds = true
        image.image = UIImage(named: "QRCode")?.withRenderingMode(.alwaysOriginal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
}
