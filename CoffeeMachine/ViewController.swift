//
//  ViewController.swift
//  CoffeeMachine
//
//  Created by Rayan Syed on 2019-11-23.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startCoffee(){
        openCoffeeScene()
    }
    
    @IBAction func openManual(){
        openManualScene()
    }
    
    func openCoffeeScene(){
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let receiptVC = mainSB.instantiateViewController(withIdentifier: "CoffeeView") as! CoffeeVC
        self.present(receiptVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(receiptVC, animated: true)
        
    }
    
    func openManualScene(){
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let manualVC = mainSB.instantiateViewController(withIdentifier: "ManualView") as! ManualVC
        self.present(manualVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(manualVC, animated: true)
    }


}

