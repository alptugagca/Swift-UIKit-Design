//
//  UserRegisterPage.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import UIKit

class UserRegisterPage: UIViewController {
    
    @IBOutlet weak var tfUserName: UITextField!
    
    var userRegisterViewModel = UserRegisterpageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonSave(_ sender: Any)
    {
        
        if let userName = tfUserName.text
        {
            userRegisterViewModel.saveData(user_name: userName)
            navigationController?.popToRootViewController(animated: true)
        }
        
    }
}
