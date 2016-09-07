//
//  ingredientesController.swift
//  Proj1PizzaWOS
//
//  Created by Francisco Ulises Roldan Trejo on 05/09/16.
//  Copyright © 2016 Francisco Ulises Roldan Trejo. All rights reserved.
//
import WatchKit
import Foundation


class ingredientesController: WKInterfaceController {

    var pedido:[String]?
    var ingredientesCount:Int = 0
 
    @IBOutlet var btnJamon: WKInterfaceSwitch!
    @IBOutlet var btnSWPepperoni: WKInterfaceSwitch!
    @IBOutlet var btnSWPavo: WKInterfaceSwitch!
    @IBOutlet var btnSWSalchicha: WKInterfaceSwitch!
    @IBOutlet var btnSWAceituna: WKInterfaceSwitch!
    @IBOutlet var btnSWCebolla: WKInterfaceSwitch!
    @IBOutlet var btnSWPimiento: WKInterfaceSwitch!
    @IBOutlet var btnSWPina: WKInterfaceSwitch!
    @IBOutlet var btnSWAnchoa: WKInterfaceSwitch!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pedido = context as? [String]
        if let pedidoPrev = pedido {
            print("El pedido")
            for index in pedidoPrev {
                print(index)
            }
        }
        
        // Configure interface objects here.
    }
    func mustraGrupoAvance() -> Bool {
        grContinua.setHidden(false)
        return true
    }
    @IBOutlet var grContinua: WKInterfaceGroup!
    
    func sumaRestaSW(ingred : String, valor : Bool) -> Bool {
        let ingrediente : String = ingred
        let valorSW : Bool = valor
        
        if (valorSW){
          pedido!.append(ingrediente)
            ingredientesCount += 1
        } else {
            pedido! = pedido!.filter(){ $0 != ingrediente}
            ingredientesCount -= 1
        }
        mustraGrupoAvance()
        return true
    }
    
    @IBAction func swJamon(value: Bool) {
        if (value && ingredientesCount < 5) {
            sumaRestaSW("Jamon", valor: value)
        }else{
            btnJamon.setOn(false)
        }
    }
    
    @IBAction func swPepperoni(value: Bool) {
        if (value && ingredientesCount < 5) {
            sumaRestaSW("Pepperoni", valor: value)
        }else{
            btnSWPepperoni.setOn(false)
        }
    }

    @IBAction func swPavo(value: Bool) {
        if (value && ingredientesCount < 5) {
            sumaRestaSW("Pavo", valor: value)
        }else{
            btnSWPavo.setOn(false)
        }
        
    }
    
    @IBAction func swSalchicha(value: Bool) {
        if (value && ingredientesCount < 5) {
            sumaRestaSW("Salchicha", valor: value)
        }else{
            btnSWSalchicha.setOn(false)
        }
    }

    @IBAction func swAceituna(value: Bool) {
        if (value && ingredientesCount < 5) {
            sumaRestaSW("Aceituna", valor: value)
        }else{
            btnSWAceituna.setOn(false)
        }
    }
    
    @IBAction func swCebolla(value: Bool) {
        if (value && ingredientesCount < 5) {
            sumaRestaSW("Cebolla", valor: value)
        }else{
            btnSWCebolla.setOn(false)
        }
    }
    
    @IBAction func swPmiento(value: Bool) {
        if (value && ingredientesCount < 5) {
            sumaRestaSW("Pimiento", valor: value)
        }else{
            btnSWPimiento.setOn(false)
        }
    }
    
    @IBAction func swPina(value: Bool) {
        if (value && ingredientesCount < 5) {
            sumaRestaSW("Pina", valor: value)
        }else{
            btnSWPina.setOn(false)
        }
    }
    
    @IBAction func swAnchoa(value: Bool) {
        if (value && ingredientesCount < 5) {
           sumaRestaSW("Anchoa", valor: value)
        }else{
           btnSWAnchoa.setOn(false)
        }
    }
    
    @IBAction func pasaExtras() {
        //if validaIngred() {
            self.pushControllerWithName("vistaExtras", context: pedido)
        //}else{
            
        //}
    
    }
    
    func validaIngred(conteo : Int) -> Bool {
        if conteo > 5 {
           return true
        }else{
            return false
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
