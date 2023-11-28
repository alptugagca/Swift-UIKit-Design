//
//  AnasayfaViewModel.swift
//  FilmlerAppCollectionView
//
//  Created by Alptuğ Ağca on 20.11.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var frepo = FilmlerDaoRepository()
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]()) //Step 4 - filmlerListesini repoda oluşturduğum gibi ilgili sayfanın viewModel oluşturmam gerekiyor ve ikisini matchlemem gerekiyor.
    
    init(){
        
        veritabaniKopyala()
        
        self.filmlerListesi = frepo.filmlerListesi //Step 5- Burada constructor içerisinde veriyi matchledim ve veriyi app açıldığında okumasını istedim.
        filmlerYukle() //Methoduda çağırman lazım.
        
    }

    
    func filmlerYukle(){ //Step 3 - ViewModel sayfamda repo classından obje yarattım. Ve methodu call ettim.
      
        frepo.filmlerYukle()
        
    }
    
    func veritabaniKopyala()//Dosyaya aktardığım veritabanının kopyalanmasını sağlıyor.
    {
        let bundleWay = Bundle.main.path(forResource: "filmler_app", ofType: ".sqlite")//Path gösterdik ve değer atadık.
        
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true).first! //Bu kodlama uygulama içerisindeki yere erişiyor.
        let copyWay = URL(fileURLWithPath: targetWay).appendingPathComponent("filmler_app.sqlite")//Değer atayarak kopyalanacak yeri oluşturuyoruz. App içerisine bu dosyayı kopyalıyoruz.
        
        let fileManager = FileManager.default //Kopyalama işlemini yapmak için fileManager oluşturduk.
        if fileManager.fileExists(atPath: copyWay.path) //if içerisinde bu değerin aynı yerde kopyası var mı yok mu kontrol ediyoruz.
        {
            print("Veritabanı zaten var.")
        }
        else
        {
            do
            {
                try fileManager.copyItem(atPath: bundleWay!, toPath: copyWay.path)//Eğer else girerse de bundle yolu içerisine kopyalanacakYer path vererek kopyalıyoruz.
            }catch{}
        }
        
        
    }

    
}
