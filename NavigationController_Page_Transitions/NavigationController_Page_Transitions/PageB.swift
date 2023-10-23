//
//  PageB.swift
//  NavigationController_Page_Transitions
//
//  Created by Alptuğ Ağca on 22.10.2023.
//

import UIKit

class PageB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goPageY(_ sender: Any)
    {
        var text = "Y Sayfasına geçildi."
        performSegue(withIdentifier: "pageYgecisTwo", sender: text)
    }
    

}
