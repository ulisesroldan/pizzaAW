
//
//  masaController.swift
//  Proj1PizzaWOS
//
//  Created by Francisco Ulises Roldan Trejo on 05/09/16.
//  Copyright © 2016 Francisco Ulises Roldan Trejo. All rights reserved.
//

import WatchKit
import Foundation


class masaController: WKInterfaceController {

    var pickerDataSource = ["Delgada", "Crujiente", "Gruesa"];
    var pickerItems:[WKPickerItem]?
    var masaSel = "Delgada"
    var pedido:[String]?

    @IBOutlet var masaPicker: WKInterfacePicker!
    
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
        masaPicker.setItems(pickerItems)
        
        // Configure interface objects here.
    }
    @IBAction func pasaQuesos() {
        if (!pedido!.isEmpty) {
            pedido = pedido!.filter(){
                $0 != masaSel
            }
        }
        pedido!.append(masaSel)
        NSLog("Pedido: \(pedido)")
        self.pushControllerWithName("vistaQueso", context: pedido)
    }
    
    @IBAction func eligeMasa(value: Int) {
        if (!pedido!.isEmpty) {
            pedido = pedido!.filter(){
                $0 != masaSel
            }
        }
        //Eliminar esta lìnea
        NSLog("List Picker: \(pickerDataSource[value]) selected")
        let pickedItem = pickerItems![value]
        if pickedItem.title != nil {
            masaSel = pickedItem.title!
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
