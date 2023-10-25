//
//  ViewController.swift
//  Calculator
//
//  Created by Alptuğ Ağca on 23.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var dataTutucu : String = ""
    var myArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func zeroButton(_ sender: Any)
    {
        let variable = "0"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
        
    }
    
    @IBAction func oneButton(_ sender: Any)
    {
        let variable = "1"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
        
    }
    
    @IBAction func twoButton(_ sender: Any)
    {
        let variable = "2"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
        
    }
    
    @IBAction func threeButton(_ sender: Any)
    {
        let variable = "3"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func fourButton(_ sender: Any)
    {
        let variable = "4"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func fiveButton(_ sender: Any)
    {
        let variable = "5"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    @IBAction func sixButton(_ sender: Any)
    {
        let variable = "6"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func sevenButton(_ sender: Any)
    {
        let variable = "7"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func eightButton(_ sender: Any)
    {
        let variable = "8"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func nineButton(_ sender: Any)
    {
        let variable = "9"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func crossButton(_ sender: Any)
    {
        let variable = "x"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func divisionButton(_ sender: Any)
    {
        let variable = "/"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func minusButton(_ sender: Any)
    {
        let variable = "-"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func deleteButton(_ sender: Any)
    {
        resultLabel.text = ""
        myArray.removeAll()
        print(resultLabel.text!)
    }
    
    @IBAction func commaButton(_ sender: Any)
    {
        let variable = ","
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
    }
    
    @IBAction func plusButton(_ sender: Any)
    {
        let variable = "+"
        dataTutucu = variable
        resultLabel.text! += dataTutucu
        print(resultLabel.text!)
        //print(myArray)
    }
    
    @IBAction func equalButton(_ sender: Any)
    {
        var total : Int = 0
        dataTutucu = resultLabel.text!
        myArray  = dataTutucu.components(separatedBy: "+")
        let arrayInt = myArray.compactMap { Int($0) }
        total = arrayInt.reduce(0,+)
        resultLabel.text = String(total)
        
    }
    
}

