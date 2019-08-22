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
    
    // MARK:- View Controller Lifecycle
    
    override func loadView() {
        self.view = transitionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitionView.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK:- Tableview Delegate & Datasource

extension TransitionController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventDashboardCell", for: indexPath) as! EventDashboardCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        transitionView.showEventDetails()
    }
}

// MARK:- Transition View Delegate

extension TransitionController: TransitionViewDelegate {
    
    func eventsTableShown() {
        transitionView.eventsTable.delegate = self
        transitionView.eventsTable.dataSource = self
    }
}
