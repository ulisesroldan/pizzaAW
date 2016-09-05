//
//  DatosAW.swift
//  Proj1PizzaWOS
//
//  Created by Francisco Ulises Roldan Trejo on 05/09/16.
//  Copyright © 2016 Francisco Ulises Roldan Trejo. All rights reserved.
//

import WatchKit

class DatosAW: NSObject {
    var tamano : String = ""
    var masa : String = ""
    var queso : String = ""
    var ingredientes : String = ""
    var extras : String = ""
    

    init(pTama:String, pMasa:String, pQueso:String){
        tamano = pTama
        masa = pMasa
        queso = pQueso
        //var ingredientes : String = ""
        //var extras : String = ""
    }
}
