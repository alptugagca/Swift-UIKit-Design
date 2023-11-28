//
//  UserDetailPage.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import UIKit

class UserDetailPage: UIViewController {

    @IBOutlet weak var tfUserName: UITextField!
    
    var us : User?
    var userDetailPageViewModel = UserDetailPageViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = us
        {
            tfUserName.text = u.user_name
        }
        
    }
    

    
    @IBAction func buttonUpdate(_ sender: Any)
    {
        if let u = us , let userName = tfUserName.text
        {
            userDetailPageViewModel.updateData(user_id: u.user_id!, user_name: userName)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
