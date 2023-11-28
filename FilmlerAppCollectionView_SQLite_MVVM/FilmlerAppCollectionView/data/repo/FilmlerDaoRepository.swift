//
//  FilmlerDaoRepository.swift
//  FilmlerAppCollectionView
//
//  Created by Alptuğ Ağca on 20.11.2023.
//

import Foundation
import RxSwift

class FilmlerDaoRepository{
    
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())//RxSwift ile ortak var ile anasayfada göstereceğim. -Step 1
    
    let db : FMDatabase?
    
    init() {
        
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true).first! //Bu kodlama uygulama içerisindeki yere erişiyor.
        let VeritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")//Değer atayarak kopyalanacak yeri oluşturuyoruz. App içerisine bu dosyayı kopyalıyoruz.
        
        db = FMDatabase(path : VeritabaniURL.path)
    }
    
    
    
    
    func filmlerYukle(){
        
        
        
        db?.open() //db open yaptık çünkü erişebilmemiz gerekiyor.
        var liste = [Filmler]() //Filmler sınıfından obje array oluşturduk
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM filmler", values: nil) //rs sabiti oluşturuduldu ve buradaki sorguyu do try catch yazdık ve rs attık.
            
            while rs.next(){//Sorgudan çekilen rs içerisindeki dataları while döngüsü ile sıralıyoruz.
                
                let film = Filmler(id: Int(rs.string(forColumn: "id"))!,
                                   ad: rs.string(forColumn: "ad")! ,
                                   resim: rs.string(forColumn: "resim")!,
                                   fiyat:Int(rs.string(forColumn: "fiyat"))!)
                                   
                liste.append(film)
                }
            filmlerListesi.onNext(liste) //Tetikleme methodu ile filmlerListesi ni repoda tutuyorum. - Step 2

        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close() //Db kapattık performans sorunu yaşamamak için.
        
    }
    
    
}
