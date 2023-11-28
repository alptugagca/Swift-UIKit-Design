//
//  ViewController.swift
//  FilmlerAppCollectionView
//
//  Created by Alptuğ Ağca on 9.11.2023.
//

import UIKit

class Anasayfa: UIViewController {

    
    @IBOutlet weak var filmlerCollectionView: UICollectionView! //Collection view anasayfada tanımladık.
    var filmlerListesi = [Filmler]() //Filmler clasından veri kümem oldğunu gösterdiğim bir nesne array oluşturdum.
    var viewModel = AnasayfaViewModel() //Step 6 viewModelden datayı okuyabilmek için o classtan nesne oluşturdum.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmlerCollectionView.delegate=self
        filmlerCollectionView.dataSource=self
        
        _ = viewModel.filmlerListesi.subscribe(onNext: {liste in
            self.filmlerListesi = liste
            self.filmlerCollectionView.reloadData()
        }) // Step 7- Burada subscribe methodu ile onNext içerisinde liste var berlirleyim sonrasında bu sınıf içerisindeki filmler Listesini call edip liste var eşitlediğimizde anasayfada data direk gözükmeli.Reload data ile verileri tekrar yükle anlamına gelen datayı kullandık.
        
        
        
        let tasarim = UICollectionViewFlowLayout() //CollectionView içerisindeki hücrelerin nasıl görülmesi gerektiğini aralarındaki boşluklar ne olmalı onu hallediyoruz.
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        //10 x 10 x 10 = 30
        let ekranGenislik = UIScreen.main.bounds.width //Ekran genişliği aldık ve değere atadık.
        let itemGenislik = (ekranGenislik - 30)/2 //Ekran genişliği 30 çıkardık ve 2 ye böldük çünkü yan yana 2 item listelenecek.
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        
        filmlerCollectionView.collectionViewLayout = tasarim
    }


}


extension Anasayfa : UICollectionViewDelegate , UICollectionViewDataSource , HucreProtocol{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return filmlerListesi.count //Bu method boyut istiyor filmler listemin boyutu kadar alan göster dedim.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row] //Hücre içerisindeki index tanımladık ve filmlerListesi içerisindeki nesnelere film ile ulaşabiliyoruz.
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre //Bu hücre sabitine filmlerHucre ID verdik ve downcasting yaparak FilmlerHucre classına göre davran dedik. Hucreyi çağırdığımda Filmler Hucre classındaki tüm UI elementlere erişeceğim.
        
        hucre.imageViewFilm.image = UIImage(named: film.resim!)
        hucre.labelFiyat.text = "\(film.fiyat!) ₺"
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor //Hücrenin yanındaki sınır çizgilerini belirledik.
        hucre.layer.borderWidth = 0.3 //Hücrenin sınır çizgilerinin inceliğini belirledik.
        hucre.layer.cornerRadius = 10.0 //Hücrenin kenarlarını yuvarlattık.
        
        hucre.hucreProtocol = self //Hucre içerisinde hucreprotokolde tanımladık.
        hucre.indexPath = indexPath //İndexpath tanımladık.
        
        return hucre
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row] //Hücre içerisindeki index tanımladık ve filmlerListesi içerisindeki nesnelere film ile ulaşabiliyoruz.
        print("\(film.ad!) seçildi.")
        performSegue(withIdentifier: "toDetay", sender: film) //Segue methodu ile datayı göndereceğimiz sayfanın bağlantısını yazdık ve sender nesnenmizi ekledik

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{ //gönderilecek sayfanın segue kontrol ettik.
            if let film = sender as? Filmler{ //Parametrede bulunann sender Filmler classına çevirdik ve film atadık.
                let gidilecekVC = segue.destination as! DetaySayfa //segue destination downcasting yaparak detaysayfaya çevirdik ve gidilecekVC eşitledik.
                gidilecekVC.film = film //gidilecekVC çağırdığımızda detaysayfadaki tüm UI elementlere erişebildik ve film eşitledik.
            }
            
        }
    }
    
    func sepeteEkleTikla(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row] //Hücre içerisindeki index tanımladık ve filmlerListesi içerisindeki nesnelere film ile ulaşabiliyoruz.
        print("\(film.ad!) hücre içerisinde sepete eklendi.")
        

    }
    
}

