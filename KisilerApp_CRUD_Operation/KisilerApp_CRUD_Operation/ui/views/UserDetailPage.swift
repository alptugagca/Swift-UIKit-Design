//
//  UserDetailPage.swift
//  KisilerApp_CRUD_Operation
//
//  Created by Alptuğ Ağca on 26.10.2023.
//

import UIKit

class UserDetailPage: UIViewController {

    
    @IBOutlet weak var tfUserName: UITextField!
    
    @IBOutlet weak var tfUserGsm: UITextField!
    
    var us : User?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if let k = us
        {
            tfUserName.text = k.kisi_ad
            tfUserGsm.text = k.kisi_tel
        }
    }
    

    @IBAction func buttonUpdate(_ sender: Any) {
        
        if let k = us,let ka = tfUserName.text , let kt = tfUserGsm.text
        {
            update(kisi_id : k.kisi_id! ,kisi_ad: ka, kisi_tel: kt)
        }
        
    }
    
    func update(kisi_id : Int ,kisi_ad : String ,kisi_tel : String)
    {
        print("Kişi Güncelle :\(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    
   

}
