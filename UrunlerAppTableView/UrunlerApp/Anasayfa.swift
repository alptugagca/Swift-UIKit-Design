//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Alptuğ Ağca on 6.11.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        let u1 = Urunler(id: 1, ad: "Macbook Pro 14", resim: "bilgisayar", fiyat: 43000)
        let u2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk", fiyat: 2500)
        let u3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 40000)
        let u4 = Urunler(id: 4, ad: "Gio Armani", resim: "parfum", fiyat: 2000)
        let u5 = Urunler(id: 5, ad: "Casio X Series", resim: "saat", fiyat: 8000)
        let u6 = Urunler(id: 6, ad: "Dyson V8", resim: "supurge", fiyat: 18000)
        let u7 = Urunler(id: 7, ad: "Iphone 13", resim: "telefon", fiyat: 32000)
        
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)

        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1) //Aradaki siyah ayraçı giderdik
        // Do any additional setup after loading the view.
    }


}

extension Anasayfa : UITableViewDelegate , UITableViewDataSource , HucreProtokol{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return urunlerListesi.count //Table view erişerek urunlerListesi array sayısı kadar satır oluştur dedik.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListesi[indexPath.row] //Burada urun sabitine indexe göre sırala dedik.
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        
        hucre.imageViewUrun.image = UIImage(named: urun.resim!) //Dolaylı bir yapı kullanıyorsak ünlem koymamız gerekiyor.
        hucre.labelUrunAd.text = urun.ad // Burada direk eşitlediğimiz için gerek yok.
        hucre.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)//Hücre arkaplanını renklendirdik.
        hucre.hucreArkaplan.layer.cornerRadius = 10.0 //Köşelerini yuvarlaştırdık
        hucre.selectionStyle = .none //Seçim animasyonunu kaldırdık.
        
        hucre.hucreProtokol = self //Hücprotokole tanımladık.
        hucre.indexPath = indexPath //İndexpath tanımladık.
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt  indexPath: IndexPath) -> UISwipeActionsConfiguration? {//Sola kaydırılınca ne yapılacağını yazdığımız fonksiyon
        
        let urun = urunlerListesi[indexPath.row] //Burada urun sabitine indexe göre sırala dedik.
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ //Kay
            contextualAction, view , bool in //contextualAction bu action ifade ediyor, View bunun tasarımını ifade ediyor. Bool tıklanıp tıklanmamasını ifade ediyor.
            print("\(urun.ad!) silindi.") //Kaydırılınca Sil alanı çıkıyor
            
        }
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
            contextualAction, view , bool in //contextualAction bu action ifade ediyor, View bunun tasarımını ifade ediyor. Bool tıklanıp tıklanmamasını ifade ediyor.
            print("\(urun.ad!) düzenlendi.") //Kaydırılınca Düzenle alanı çıkıyor
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction]) //return type içerisine iki action yazıyoruz.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row] //Burada urun sabitine indexe göre sırala dedik.
        print("\(urun.ad!) seçildi.")
        performSegue(withIdentifier: "toDetay", sender: urun)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"
        {
            if let urun = sender as? Urunler{
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.urun = urun
            }
        }
    }
    
    func sepeteEkleTiklandi(indexpath: IndexPath) {
        //Burada anasayfa içerisinde bağlantıyı kurduk anasayfaya protokol olarak ekledik.
        
        let urun = urunlerListesi[indexpath.row]
        print("\(urun.ad!) sepete eklendi")
        
        
        
    }
    
}

