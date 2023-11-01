//
//  UserRegisterPage.swift
//  KisilerApp_CRUD_Operation
//
//  Created by Alptuğ Ağca on 26.10.2023.
//

import UIKit

class UserRegisterPage: UIViewController {
    
    @IBOutlet weak var tfUserName: UITextField!
    
    @IBOutlet weak var tfUserGsm: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func buttonSave(_ sender: Any) {
        
        if let ka = tfUserName.text , let kt = tfUserGsm.text
        {
            save(kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    
    func save(kisi_ad : String ,kisi_tel : String)
    {
        print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)")
    }

}
