//
//  PassAPI.swift
//  Event Scanner
//
//  Created by Ateeth Sai Kosuri on 8/22/19.
//  Copyright © 2019 American Express. All rights reserved.
//

import Foundation
import Alamofire

class PassAPI {
    
    var events: Array<[String: Any]> = []
    var output: [String: Any] = [:]
    
    weak var delegate: PassAPIDelegate?
    
    func getListOfEvents(userID: String) {
        Alamofire.request("https://asm-pass.herokuapp.com/api/v1/user/" + userID + "/events").responseJSON { response in
            if let json = (response.result.value) as? [String: Array<[String: Any]>] {
                let count = json["results"]?.count
                var counter = 0
                for i in json["results"]! {
                    var eventDetails = self.getEventDetails(id: i["eventid"]! as! String)
                    eventDetails.updateValue(i["arrived"]!, forKey: "arrived")
                    self.events.append(eventDetails)
                    counter += 1
                }
                if counter == count {
                    self.delegate?.didUpdateEvents()
                }
            }
        }
    }
    
    func getEventDetails(id: String) -> [String: Any] {
        Alamofire.request("https://asm-pass.herokuapp.com/api/v1/event/" + id + "/summary").responseJSON { response in
            if let json = (response.result.value) as? [String: Any] {
                self.output = json
            }
        }
        return output
    }
    
}

protocol PassAPIDelegate: class {
    func didUpdateEvents()
}
