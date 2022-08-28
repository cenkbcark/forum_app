//
//  Model.swift
//  techForum_app
//
//  Created by Cenk Bahadır Çark on 22.08.2022.
//

import Foundation
import Firebase

class itemModel: NSObject {
    
    private var _ref: DatabaseReference!
    
    private var _key: String!
    private var _title: String!
    private var _desc: String!
    private var _email: String!
    private var _category: String!
    
    var key: String{
        return _key
    }
    var title: String{
        return _title
    }
    var desc: String{
        return _desc
    }
    var email: String{
        return _email
    }
    var category: String{
        return _category
    }
    
    init(key: String, dictionary : Dictionary<String, AnyObject>){
        
        self._key = key
        
        if let title = dictionary["title"] as? String{
            self._title = title
        }
        if let desc = dictionary["desc"] as? String{
            self._desc = desc
        }
        if let email = dictionary["email"] as? String{
            self._email = email
        }
        if let category = dictionary["category"] as? String{
            self._category = category
        }
        
        self._ref = DataService.dataService.item_REF.child(self._key)
        
        
    }
    
    
    
}
