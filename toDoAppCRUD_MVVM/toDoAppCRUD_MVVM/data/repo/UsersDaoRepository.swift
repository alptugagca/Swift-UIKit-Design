//
//  UsersDaoRepository.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import Foundation
import RxSwift

class UsersDaoRepository
{
    var userLists = BehaviorSubject<[User]>(value: [User]()) //RXswift için kisiler ortak kod variable  beslenecek.

    
    let db : FMDatabase?
    
    init()
    {
        let pathWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let databaseURL = URL(fileURLWithPath: pathWay).appendingPathComponent("users.sqlite")
        
        db = FMDatabase(path: databaseURL.path)
    }
    
    func readData()
    {
        db?.open()
        var lists = [User]()
        
        do{
            let rd = try db!.executeQuery("SELECT * FROM toDos", values: nil)
           
            while rd.next()
            {
                let us = User(user_id: Int(rd.string(forColumn: "user_id"))!,
                              user_name: rd.string(forColumn: "user_name")!)
                
                lists.append(us)
            }
        
        userLists.onNext(lists)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func saveData(user_name : String)
    {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO toDos (user_name) VALUES (?)", values: [user_name])
        }catch{
            print(error.localizedDescription)
        }

        db?.close()
    }
    
    func updateData(user_id : Int , user_name :String)
    {
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE toDos SET user_name = ? WHERE user_id = ?", values: [user_name,user_id]) //Query tetikleyerek update yapacağız. Burada alanları belirttikten sonra executeUpdate values tan sonra parametre olarak değerleri girmeliyiz.
        }catch{
            print(error.localizedDescription)
        }

        db?.close()
        
        
    }
    
    func deleteData(user_id : Int)
    {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM toDos WHERE user_id = ?", values: [user_id])
                readData()
        }catch{
            print(error.localizedDescription)
        }

        db?.close()
    }
    
    func searchData(searchTexts:String)
    {
        db?.open()
        var lists = [User]()
        
        do{
            let rd = try db!.executeQuery("SELECT * FROM toDos WHERE user_name like '%\(searchTexts)%'", values: nil)
           
            while rd.next(){
                let us =  User(user_id: Int(rd.string(forColumn: "user_id"))!,
                                 user_name: rd.string(forColumn: "user_name")!)
                
                lists.append(us)
            }
            
            userLists.onNext(lists)

        }catch{
            print(error.localizedDescription)
        }

        db?.close()
    }
    
    
    
}

