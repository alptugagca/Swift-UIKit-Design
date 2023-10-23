//
//  PageA.swift
//  NavigationController_Page_Transitions
//
//  Created by Alptuğ Ağca on 22.10.2023.
//

import UIKit

class PageA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goPageB(_ sender: Any)
    {
        var text = "B Sayfasına geçildi."
        performSegue(withIdentifier: "pageBgecis", sender: text)
    }
    
}
