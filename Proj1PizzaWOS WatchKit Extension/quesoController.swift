//
//  quesoController.swift
//  Proj1PizzaWOS
//
//  Created by Francisco Ulises Roldan Trejo on 05/09/16.
//  Copyright © 2016 Francisco Ulises Roldan Trejo. All rights reserved.
//

import WatchKit
import Foundation


class quesoController: WKInterfaceController {
    var pickerDataSource = ["Mozarela", "Cheddar", "Parmesano", "Sin queso"];
    var pickerItems:[WKPickerItem]?
    var quesoSel = "Mozarela"
    var pedido:[String]?
    @IBOutlet var quesoPicker: WKInterfacePicker!

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pedido = context as? [String]
        if let pedidoPrev = pedido {
            print("El pedido")
            for index in pedidoPrev {
                print(index)
            }
        }

        pickerItems = pickerDataSource.map(){
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            pickerItem.caption = $0
            return pickerItem
        }
        quesoPicker.setItems(pickerItems)
        // Configure interface objects here.
    }

    @IBAction func pasaIngred() {
        if (!pedido!.isEmpty) {
            pedido = pedido!.filter(){
                $0 != quesoSel
            }
        }
        pedido!.append(quesoSel)
        self.pushControllerWithName("vistaIngred", context: pedido)
    }
    @IBAction func eligeQueso(value: Int) {
        if (!pedido!.isEmpty) {
            pedido = pedido!.filter(){
                $0 != quesoSel
            }
        }
        //Eliminar esta lìnea
        NSLog("List Picker: \(pickerDataSource[value]) selected")
        NSLog("pedido: \(pedido)  selected")
        let pickedItem = pickerItems![value]
        if pickedItem.title != nil {
            quesoSel = pickedItem.title!
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
