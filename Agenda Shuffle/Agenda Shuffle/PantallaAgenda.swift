//
//  PantallaAgenda.swift
//  Agenda Shuffle
//
//  Created by alumno on 2/26/25.
//


import SwiftUI
 
let contactos = [
    ContactoAgenda(nombre: "Juan", telefono:"12345"),
    ContactoAgenda(nombre: "Juana", telefono:"123455"),
    ContactoAgenda(nombre: "Juaewefano", telefono:"3225"),
    ContactoAgenda(nombre: "Joan", telefono:"52415"),
    ContactoAgenda(nombre: "Juan", telefono:"12345"),
    ContactoAgenda(nombre: "Juana", telefono:"123455"),
    ContactoAgenda(nombre: "Juaewefano", telefono:"3225"),
    ContactoAgenda(nombre: "Joan", telefono:"52415"),
]
struct PantallaAgenda: View {
    var largo_de_pantalla = UIScreen.main.bounds.width
    var ancho_de_pantalla = UIScreen.main.bounds.height
    
    @State var mostrar_pantalla_agregar_contacto: Bool = false
    
    @State var contactos_actuales: [ContactoAgenda] = [
        ContactoAgenda(nombre: "Joan", telefono:"52415"),
        ContactoAgenda(nombre: "Joan", telefono:"52415"),
        ContactoAgenda(nombre: "Joan", telefono:"52415"),
        ContactoAgenda(nombre: "Joan", telefono:"52415"),
        ContactoAgenda(nombre: "Joan", telefono:"52415"),
        ContactoAgenda(nombre: "Joan", telefono:"52415"),
    ]
    
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                ForEach(contactos_actuales){ contacto in
                    //Text("\(contacto.nombre)")
                    ContactoPrevista(contacto_a_mostrar: contacto, al_pulsar:
                                        {print("Te envia saludos \(contacto.nombre) desde la pantalla agenda")})
                }
            }
            .frame(alignment: Alignment.center)
            .padding(10)
            .background(Color.cyan)
        }
        .background(Color.green)
        
        
        HStack(alignment: VerticalAlignment.center, spacing: 25) {
            ZStack{
                Circle()
                    .frame(width:100)
                    .tint(Color.red)
                    .foregroundColor(Color.green)
                
                Rectangle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.cyan)
                
                Image(systemName: "plus")
                    .background(Color.red)
            }
            
            .padding(15)
            .onTapGesture {
                print("Falta implementar la seccion agregar contacto")
                mostrar_pantalla_agregar_contacto.toggle()
            }
            
            Spacer()
            
            ZStack{
                Circle()
                    .frame(width:100)
                    .tint(Color.red)
                    .foregroundColor(Color.green)
                
                Circle()
                    .frame(width: 65, height: 65)
                    .foregroundColor(Color.cyan)
                
                Image(systemName: "shuffle")
                    .background(Color.red)
            }
            
            .padding(15)
            .onTapGesture {
                print("Lanzar un intent para iniciar llamada")
            }
        
        }
        .background(Color.purple)
        .sheet(isPresented: $mostrar_pantalla_agregar_contacto){
            pantalla_agregar_contacto(boton_salir: {
                mostrar_pantalla_agregar_contacto.toggle()
            },
             boton_agregar: {nombre, numero in
                let contacto_nuevo = ContactoAgenda(nombre: nombre, telefono: numero)
                contactos_actuales.append(contacto_nuevo)
                mostrar_pantalla_agregar_contacto.toggle()
            })
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
