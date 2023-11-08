//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by Alptuğ Ağca on 6.11.2023.
//

import UIKit


protocol HucreProtokol{
    
    func sepeteEkleTiklandi(indexpath : IndexPath) //Protokolü yazmamızın sebebi anasayfa ile ürünlerhücre arasında bağlantı kurmak tetikleyen taraf ile kullanan tarafı birleştireceğiz.
}


class UrunlerHucre: UITableViewCell {

    @IBOutlet weak var hucreArkaplan: UIView!
    
    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunAd: UILabel!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    var hucreProtokol : HucreProtokol? //Elimizde bunu çağırabileceğimiz bir nesne yoktu erişmek için nesne oluşturduk.Şimdi bu protokol içerisindeki methodu butonumuzun içerisinde tetikleyeceğiz.
    
    var indexPath : IndexPath = [] //Indexpath elimde yoktu bu sebeple var oluştutarak parametre içerisinde çağırıyorum.
    
    //Not bu iki değeri yetkilendirmem lazım bu sebeple anasayfa classında hücre içerisinde bunları tanımlammız gerekiyor.
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func urunSepeteEkle(_ sender: Any) { //Buna erişe
        
        hucreProtokol?.sepeteEkleTiklandi(indexpath: indexPath)
    }
    
}
