//
//  confirmarController.swift
//  Proj1PizzaWOS
//
//  Created by Francisco Ulises Roldan Trejo on 07/09/16.
//  Copyright © 2016 Francisco Ulises Roldan Trejo. All rights reserved.
//

import WatchKit
import Foundation


class confirmarController: WKInterfaceController {

    var pedido:[String]?
    var textoPedido : String = "Pedido: "
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pedido = context as? [String]
        if let pedidoPrev = pedido {
            print("El pedido")
            for index in pedidoPrev {
                textoPedido += "\(index), "
                print(index)
            }
        }
        lblPedido.setText(textoPedido)
        // Configure interface objects here.
    }

    @IBOutlet var lblPedido: WKInterfaceLabel!
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
