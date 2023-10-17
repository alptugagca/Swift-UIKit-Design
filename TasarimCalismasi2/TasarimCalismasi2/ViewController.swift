//
//  ViewController.swift
//  TasarimCalismasi2
//
//  Created by Alptuğ Ağca on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Clothes Detail"
        
        let apperance = UINavigationBarAppearance()
        apperance.backgroundColor = UIColor(named: "anaRenk")
        
        apperance.titleTextAttributes = [.foregroundColor : UIColor(named: "yaziRenk1")!]
        
        navigationController?.navigationBar.barStyle = .black //Telefon şarj ve saat olarak görünüm yerleri ayarladık siyahtı beyaz yaptık buradaki matık şu barStyle dedik ki benim temam koyu ona göre bu alanı göster dedik.
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance

    }


}

