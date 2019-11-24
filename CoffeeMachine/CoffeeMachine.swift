//
//  CoffeeMachine.swift
//  CoffeeMachine
//
//  Created by Rayan Syed on 2019-11-23.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import Foundation

class CoffeeMachine{
    
    func filterCoffee() -> String{
        return ""
    }
    
    func brewCoffee() -> String{
        return ""
    }
    
}

class RegularMachine: CoffeeMachine {
    var milkAmount : Int!
    var sugarAmount : Int!
    var waterType : String! = ""
    var beanType : String! = "Regular"
    var filterType : String = "Standard"
    
    init(milk : Int, sugar : Int, water : String, bean : String){
        self.milkAmount = milk
        self.sugarAmount = sugar
        self.waterType = water
        self.beanType = bean
    }
    override func filterCoffee() -> String {
        return self.filterType
    }
    override func brewCoffee() -> String {
        return "Regular Brew"
    }
    
}

class EspressoMachine: CoffeeMachine {
    
    var milkAmount : Int!
    var sugarAmount : Int!
    var waterType : String! = ""
    var beanType : String! = "Espresso"
    var filterType : String = "Premium"
    var grinderType : String = "Manual"

    
    init(milk : Int, sugar : Int, water : String, bean : String){
        self.milkAmount = milk
        self.sugarAmount = sugar
        self.waterType = water
        self.beanType = bean

    }
    
    override func filterCoffee() -> String {
        var filter : String = "Filtering coffee with \(filterType) filter and \(grinderType) grinded beans"
        return filter
   
    }
    override func brewCoffee() -> String {
        return "Espresso Brew"
        
    }
    
    
}

