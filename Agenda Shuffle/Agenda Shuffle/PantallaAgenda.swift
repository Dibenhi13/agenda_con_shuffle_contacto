//
//  PantallaAgenda.swift
//  Agenda Shuffle
//
//  Created by alumno on 2/26/25.
//


import SwiftUI

let contactos = [
    ContactoAgenda(nombre: "Juan", telefono:"1232345"),
    ContactoAgenda(nombre: "Juana", telefono:"1232345"),
    ContactoAgenda(nombre: "Juan", telefono:"1232345"),
    ContactoAgenda(nombre: "Juan", telefono:"1232345"),
    ContactoAgenda(nombre: "Juan", telefono:"1232345"),
    ContactoAgenda(nombre: "Juan", telefono:"1232345"),
    ContactoAgenda(nombre: "Juan", telefono:"1232345"),
    ContactoAgenda(nombre: "Juan", telefono:"1232345"),
    ContactoAgenda(nombre: "Juan", telefono:"1232345")
]


struct PantallaAgenda: View {
    var body: some View {
        List{
            VStack {
                ForEach(contactos){ contacto in
                    Text("\(contacto.nombre)")
                    ContactoPrevista()
                }
            }
            .background(Color.cyan)
        }
        
    }
}

/*
 modelo: MVC Controlador (iniciar sesion, login automatico)
 modelo: modelo vista vistamodelo
 modelo modelo vista (vista controlador modelo)
 */

#Preview {
    PantallaAgenda()
}
