//
//  contacto_agenda.swift
//  Agenda Shuffle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI

struct ContactoAgenda: Identifiable {
    var nombre : String
    var telefono : String
    
    var id: String {nombre}
}

/*
var nombre = "Pepito Veraz"

var _nombre: String

var _nombre: set{
    let nombre_validado = filtar_palabras(value):
            _nombre = nombre_validado
}
get{
    return _nombre.split("")[0]
}
*/
