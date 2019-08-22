//
//  PrimaryVC.swift
//  Event Scanner
//
//  Created by Ateeth Sai Kosuri on 8/21/19.
//  Copyright © 2019 American Express. All rights reserved.
//

import UIKit
import EasyPeasy

class TransitionController: UIViewController {
    
    var transitionView = TransitionView()
    var events: Array<[String: Any]> = []
    
    // MARK:- View Controller Lifecycle
    
    override func loadView() {
        self.view = transitionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitionView.delegate = self
        transitionView.setUser(newUser: user2)
        transitionView.api.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK:- Scan QR Code
    
    @objc func openScanView() {
        present(ScanController(), animated: true) {
            //
        }
    }
}

// MARK:- Tableview Delegate & Datasource

extension TransitionController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventDashboardCell", for: indexPath) as! EventDashboardCell
        if (indexPath.row % 2) == 0 {
            cell.eventImage.image = UIImage(named: "Image1")?.withRenderingMode(.alwaysOriginal)
        } else {
            cell.eventImage.image = UIImage(named: "Image2")?.withRenderingMode(.alwaysOriginal)
        }
        if (transitionView.user["type"] == "organizer") { cell.statusIcon.alpha = 0.0 }
//        cell.eventNameLabel.text = String(describing: events[indexPath.row]["title"])
//        cell.timeLabel.text = String(describing: events[indexPath.row]["startdate"])
//        cell.locationLabel.text = String(describing: events[indexPath.row]["location"])
//        if
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row % 2) == 0 {
            transitionView.showEventDetails(image: (UIImage(named: "Image1")?.withRenderingMode(.alwaysOriginal))!)
        } else {
            transitionView.showEventDetails(image: (UIImage(named: "Image2")?.withRenderingMode(.alwaysOriginal))!)
        }
    }
}

// MARK:- Transition View Delegate

extension TransitionController: TransitionViewDelegate {
    
    func eventDetailsShown() {
        transitionView.eventDetails.scanQRButton.addTarget(self, action: #selector(openScanView), for: .touchUpInside)
    }
    
    
    func eventsTableShown() {
        transitionView.eventsTable.delegate = self
        transitionView.eventsTable.dataSource = self
    }
}

extension TransitionController: PassAPIDelegate {
    
    func didUpdateEvents() {
        self.events = transitionView.api.events
        self.transitionView.eventsTable.reloadData()
    }
    
}
