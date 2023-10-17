//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by Alptuğ Ağca on 14.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pizza" //Self dediğimiz zaman viewDidLoad içerisinden kendinden bir değer al dedik.
        
        let apperance = UINavigationBarAppearance() //Navigation bar apperanca olarak sabite atadık.
        apperance.backgroundColor = UIColor(named: "anaRenk") //Apperaxnce sabit olarak belirledik ve background colour asset içerisinde belirlediğimiz renk verdik.
        apperance.titleTextAttributes =
        [.foregroundColor : UIColor(named: "yaziRenk1")! ,.font : UIFont(name: "Pacifico-Regular", size: 22)!] //Burada tittle renk ve fontunu ayarladık font için dosyayı indirdik ve Info.plist içerisinde font dosyasını aktardık ve buradan aldığımız fontu size ile yazdırdık.
        
        navigationController?.navigationBar.barStyle = .black //Telefon şarj ve saat olarak görünüm yerleri ayarladık siyahtı beyaz yaptık buradaki matık şu barStyle dedik ki benim temam koyu ona göre bu alanı göster dedik.
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        //Çentikli ekran yuvarlak ekran gibi modellerde görününümü ayarlamak için burada apperance 3 adet method ekledik.
        
        
        

    }


}

