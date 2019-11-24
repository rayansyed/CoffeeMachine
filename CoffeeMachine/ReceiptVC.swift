//
//  ReceiptVC.swift
//  CoffeeMachine
//
//  Created by Rayan Syed on 2019-11-24.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit

class ReceiptVC: UIViewController {
    
    @IBOutlet var coffeeLabel : UILabel!
    @IBOutlet var waterLabel : UILabel!
    @IBOutlet var milkLabel : UILabel!
    @IBOutlet var sugarLabel : UILabel!
    @IBOutlet var dispensingLabel : UILabel!
    @IBOutlet var temperatureLabel : UILabel!
    @IBOutlet var temperatureCelcius :UILabel!
    @IBOutlet var warmButton : UIButton!
    @IBOutlet var makeCoffeeButton : UIButton!
    
    
    var coffeeType : String! = ""
    var waterType : String! = ""
    var milkAmount : Int!
    var sugarAmount : Int!
    var tempTimer : Int = 60
    var timerTest : Timer?


    override func viewDidLoad() {
        super.viewDidLoad()
        temperatureLabel.isHidden = true
        temperatureCelcius.isHidden = true
        warmButton.isHidden = true
        makeCoffeeButton.isHidden = true
        
        
        coffeeLabel.text = coffeeType
        waterLabel.text = waterType
        milkLabel.text = String(milkAmount)
        sugarLabel.text = String(sugarAmount)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
            self.dispensingLabel.text = "Filtering..."
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6.0) {
            self.dispensingLabel.text = "Coffee Ready!"
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6.0) {
            self.temperatureLabel.isHidden = false
            self.temperatureCelcius.isHidden = false
            self.warmButton.isHidden = false
            self.makeCoffeeButton.isHidden = false
        }

        // Do any additional setup after loading the view.
        guard timerTest == nil else { return }

         timerTest = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) {
             (_) in
            self.tempTimer -= 1
            self.temperatureCelcius.text = String("\(self.tempTimer)°C")
         }
   
    }
    
    @IBAction func warmCoffee(){
        timerTest?.invalidate()
        timerTest = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) {
            (_) in
            
            if (self.tempTimer == 71){
                self.timerTest?.invalidate()
                self.warmButton.isEnabled = false
            }
        
           self.tempTimer += 1
           self.temperatureCelcius.text = String("\(self.tempTimer)°C")
        }
        
    }
    
    @IBAction func orderMenu(){
        openCoffeeScene()
        
    }
    
    
    func openCoffeeScene()
     {
         let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let coffeeVC = mainSB.instantiateViewController(withIdentifier: "CoffeeView") as! CoffeeVC
         self.present(coffeeVC, animated: true, completion: nil)
         self.navigationController?.pushViewController(coffeeVC, animated: true)
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
