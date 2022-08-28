//
//  Service.swift
//  techForum_app
//
//  Created by Cenk Bahadır Çark on 22.08.2022.
//

import Foundation
import Firebase

let baseURL = "https://twitterclonefirebase-46ed3-default-rtdb.europe-west1.firebasedatabase.app/"

class DataService {
    
    static let dataService = DataService()
    
    private var baseRef = Database.database(url: "https://twitterclonefirebase-46ed3-default-rtdb.europe-west1.firebasedatabase.app").reference(fromURL: "\(baseURL)")
    private var itemRef = Database.database(url: "https://twitterclonefirebase-46ed3-default-rtdb.europe-west1.firebasedatabase.app").reference(fromURL: "\(baseURL)/items")
    
    var base_REF : DatabaseReference{
        return baseRef
    }
    var item_REF : DatabaseReference{
        return itemRef
    }
    
    
    
    
    
}
