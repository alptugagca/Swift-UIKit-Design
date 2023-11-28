//
//  UserDetailPageViewModel.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import Foundation
class UserDetailPageViewModel
{
    var usersRepo = UsersDaoRepository()
    
    func updateData(user_id : Int , user_name :String)
    {
        usersRepo.updateData(user_id: user_id, user_name: user_name)
    }
}
