//
//  Filmler.swift
//  FilmlerAppCollectionView
//
//  Created by Alptuğ Ağca on 9.11.2023.
//

import Foundation

class Filmler
{
    
    var id:Int?
    var ad:String?
    var resim:String?
    var fiyat:Int?
    
    init(){
        
    }
    
    init(id: Int, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
    
    
    
}
