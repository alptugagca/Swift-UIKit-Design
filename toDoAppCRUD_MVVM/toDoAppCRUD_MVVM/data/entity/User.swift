//
//  User.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import Foundation

class User{
    
    var user_id:Int?
    var user_name:String?
    
    
    init()
    {
        
    }
    
    init(user_id:Int, user_name:String)
    {
        self.user_id = user_id
        self.user_name = user_name
    }
}
