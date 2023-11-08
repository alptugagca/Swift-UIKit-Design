//
//  DetaySayfa.swift
//  UrunlerApp
//
//  Created by Alptuğ Ağca on 6.11.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var imageViewUrun: UIImageView!
    
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    var urun : Urunler? //Urunler classından nesneler için variable tanımladık.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = urun { //u eşitledik ve
            self.navigationItem.title = u.ad //navigation bar tittle eşitledik.
            imageViewUrun.image = UIImage(named: u.resim!)
            labelUrunFiyat.text = "\(u.fiyat!) ₺"
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        if let u = urun {
            
            print("Detay Sayfa içerisinde \(u.ad!) sepete eklendi.")
            
        }
        
    }
    

}
