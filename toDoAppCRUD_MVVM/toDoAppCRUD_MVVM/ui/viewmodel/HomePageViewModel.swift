//
//  HomePageViewModel.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import Foundation
import RxSwift

class HomePageViewModel
{
    var usersRepo = UsersDaoRepository()
    var userLists = BehaviorSubject<[User]>(value: [User]())
    
    
    init() {
        databaseCopy()
        
        userLists = usersRepo.userLists
        
        readData()
    }
    
    func readData()
    {
        usersRepo.readData()
    }
    
    func searchData(searchTextViewModelParameters : String)
    {
        usersRepo.searchData(searchTexts: searchTextViewModelParameters)
    }
    
    func deleteData(user_id : Int)
    {
        usersRepo.deleteData(user_id: user_id)
    }
    
    
    
    
    
    func databaseCopy()
    {
        let bundleWay = Bundle.main.path(forResource: "users", ofType: ".sqlite")//Path gösterdik ve değer atadık.
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true).first! //Bu kodlama uygulama içerisindeki yere erişiyor.
        let copyWay = URL(fileURLWithPath: targetWay).appendingPathComponent("users.sqlite")//Değer atayarak kopyalanacak yeri oluşturuyoruz. App içerisine bu dosyayı kopyalıyoruz.
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
