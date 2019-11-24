//
//  CoffeeVC.swift
//  CoffeeMachine
//
//  Created by Rayan Syed on 2019-11-23.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit

class CoffeeVC: UIViewController
{
    
    @IBOutlet var regularBeanSwitch : UISwitch!
    @IBOutlet var espressoBeanSwitch : UISwitch!
    @IBOutlet var distilledWaterSwitch : UISwitch!
    @IBOutlet var regularWaterSwitch : UISwitch!
    @IBOutlet var milkCounter : UILabel!
    @IBOutlet var sugarCounter : UILabel!
        
    
    var amountMilk : Int!
    var amountSugar : Int!
    var waterType : String!
    var beanType : String!
    var selectedCoffee : String! = "Unknown"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regularWaterSwitch.isOn = true
        distilledWaterSwitch.isOn = false
        espressoBeanSwitch.isOn = false
        regularBeanSwitch.isOn = true
        
        beanType = "Regular"
        waterType = "Regular"
        
//
//        if(distilledWaterSwitch.isOn)
//        {
//            waterType = "Distilled"
//        }
//        else
//        {
//            waterType = "Regular"
//        }
        
        
        
    
    }
    
    @IBAction func increaseMilk(){
        var ncream = Int(milkCounter.text!) ?? 0
        ncream += 1;
        
        milkCounter.text = String(ncream)
    }
    
    @IBAction func decreaseMilk(){
        var ncream = Int(milkCounter.text!) ?? 0
        
        if ncream > 0{
            ncream -= 1;
        }
        
        milkCounter.text = String(ncream)
    }
    
    @IBAction func increaseSugar(){
        var nsugar = Int(sugarCounter.text!) ?? 0
        nsugar += 1;
        
        sugarCounter.text = String(nsugar)
    }
    
    @IBAction func decreaseSugar(){
        var nsugar = Int(sugarCounter.text!) ?? 0
        
        if nsugar > 0{
            nsugar -= 1;
        }
        
        sugarCounter.text = String(nsugar)
    }
    
    @IBAction func disableEsspresoBeans(){
        espressoBeanSwitch.isOn = false
        regularBeanSwitch.isOn = true
        beanType = "Regular"

    }
    
    @IBAction func disableRegBeans(){
        regularBeanSwitch.isOn = false
        espressoBeanSwitch.isOn = true
        beanType = "Espresso"
    }
    
    
    @IBAction func disableRegularWater(){
        regularWaterSwitch.isOn = false
        distilledWaterSwitch.isOn = true
        waterType = "Distilled"
    }
    
    @IBAction func disableDistilledWater(){
        regularWaterSwitch.isOn = true
        distilledWaterSwitch.isOn = false
        waterType = "Regular"
    }
    
    @IBAction func brewCoffee(){
        
        amountMilk = Int(milkCounter.text!) ?? 0
        amountSugar = Int(sugarCounter.text!) ?? 0
        
        if(regularBeanSwitch.isOn)
        {
            let newCoffee = RegularMachine(milk: amountMilk, sugar: amountSugar,
                                           water: waterType, bean: beanType)
        }
        else
        {
            let newCoffee = EspressoMachine(milk: amountSugar, sugar: amountSugar,
                                            water: waterType, bean: beanType)
        }
        
        openReceiptScene()
        
    }
    
    
    func openReceiptScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let receiptVC = mainSB.instantiateViewController(withIdentifier: "ReceiptView") as! ReceiptVC
        receiptVC.coffeeType = self.beanType
        receiptVC.milkAmount = self.amountMilk
        receiptVC.sugarAmount = self.amountSugar
        receiptVC.waterType = self.waterType

        
        self.present(receiptVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(receiptVC, animated: true)
    }

    
}
