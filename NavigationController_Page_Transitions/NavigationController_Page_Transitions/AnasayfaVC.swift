//
//  ViewController.swift
//  NavigationController_Page_Transitions
//
//  Created by Alptuğ Ağca on 22.10.2023.
//

import UIKit

class AnasayfaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func goPageA(_ sender: Any)
    {
            var text = "A Sayfasına geçildi."
            performSegue(withIdentifier: "pageAgecis", sender: text)
    }
    
    @IBAction func goPageX(_ sender: Any)
    {
            var text = "X Sayfasına geçildi."
            performSegue(withIdentifier: "pageXgecis", sender: text)
    }
    
    
  

}

