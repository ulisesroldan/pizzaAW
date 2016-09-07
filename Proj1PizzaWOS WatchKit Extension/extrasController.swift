//
//  extrasController.swift
//  Proj1PizzaWOS
//
//  Created by Francisco Ulises Roldan Trejo on 05/09/16.
//  Copyright © 2016 Francisco Ulises Roldan Trejo. All rights reserved.
//

import WatchKit
import Foundation


class extrasController: WKInterfaceController {

    var pedido:[String]?
    
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
    func sumaRestaSW(ingred : String, valor : Bool) -> Bool {
        let ingrediente : String = ingred
        let valorSW : Bool = valor
        
        if (valorSW){
            pedido!.append(ingrediente)
        } else {
            pedido! = pedido!.filter(){ $0 != ingrediente}
        }
        return true
    }
  
    
    @IBAction func swQuesoAdic(value: Bool) {
        sumaRestaSW("Queso adicional", valor: value)
    }
    
    @IBAction func wsDedos(value: Bool) {
        sumaRestaSW("Dedos de queso", valor: value)
    }
    
    @IBAction func swRefresco(value: Bool) {
        sumaRestaSW("Refresco", valor: value)
    }
    
    @IBAction func pasaConfirmar() {
        self.pushControllerWithName("vistaConfirmar", context: pedido)
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
