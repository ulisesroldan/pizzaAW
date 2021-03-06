//
//  tamanoController.swift
//  Proj1PizzaWOS
//
//  Created by Francisco Ulises Roldan Trejo on 05/09/16.
//  Copyright © 2016 Francisco Ulises Roldan Trejo. All rights reserved.
//

import WatchKit
import Foundation


class tamanoController: WKInterfaceController {
    
    var pickerDataSource = ["Chica", "Mediana", "Grande"];
    var pickerItems:[WKPickerItem]?
    var tamanoSel = "Chico"
    var pedido:[String] = []
    
    @IBOutlet var tamanoPicker: WKInterfacePicker!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pickerItems = pickerDataSource.map(){
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            pickerItem.caption = $0
            return pickerItem
        }
        tamanoPicker.setItems(pickerItems)
      }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pasaMasa() {
    if (!pedido.isEmpty) {
            pedido = pedido.filter(){
                $0 != tamanoSel
        }
        }
        pedido.append(tamanoSel)
       self.pushControllerWithName("vistaMasa", context: pedido)
    }
    
    @IBAction func eligeTamano(value: Int) {
        if (!pedido.isEmpty) {
            pedido = pedido.filter(){
                $0 != tamanoSel
            }
        }
        //Eliminar esta lìnea
        NSLog("List Picker: \(pickerDataSource[value]) selected")
        let pickedItem = pickerItems![value]
        if pickedItem.title != nil {
            tamanoSel = pickedItem.title!
        }
    }
 }
