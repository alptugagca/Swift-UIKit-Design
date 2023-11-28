//
//  UserRegisterPageViewModel.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import Foundation

class UserRegisterpageViewModel
{
    var usersRepo = UsersDaoRepository()
    
    func saveData(user_name : String)
    {
        usersRepo.saveData(user_name: user_name)
    }
    
    
}
