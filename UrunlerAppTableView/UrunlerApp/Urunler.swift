//
//  Urunler.swift
//  UrunlerApp
//
//  Created by Alptuğ Ağca on 6.11.2023.
//

import Foundation

class Urunler
{
    
    
    var id:Int?
    var ad:String?
    var resim:String?
    var fiyat:Int?
    
    
    
     init(id: Int , ad: String, resim: String, fiyat: Int)
    {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
    
    init(){
    }
    
}
