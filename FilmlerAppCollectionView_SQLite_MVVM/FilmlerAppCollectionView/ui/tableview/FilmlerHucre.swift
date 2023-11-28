//
//  FilmlerHucre.swift
//  FilmlerAppCollectionView
//
//  Created by Alptuğ Ağca on 9.11.2023.
//

import UIKit

protocol HucreProtocol{
    func sepeteEkleTikla(indexPath : IndexPath) //Protokol oluşturduk çünkü kullanıcağımız yerden çağırmamız lazım.
}

class FilmlerHucre: UICollectionViewCell {
    
    @IBOutlet weak var imageViewFilm: UIImageView!
    
    @IBOutlet weak var labelFiyat: UILabel!
    
    var hucreProtocol : HucreProtocol? //Dışardan hucreprotokol aldık
    var indexPath : IndexPath?//Dışardan ındexpath aldık
    
    @IBAction func buttonSepeteEkle(_ sender: Any) { //Hücre içerisindeki tetikleyen method bu olacak. Anasayfada kullanmak için başka method oluşturacağız.
        
        hucreProtocol?.sepeteEkleTikla(indexPath: indexPath!) //Hücreprotokol protokol içerisindeki methodu cağırdık.Oda aslında anasayfadaki methodun içerisindeki değeri çağırdı.
    }
    
}
