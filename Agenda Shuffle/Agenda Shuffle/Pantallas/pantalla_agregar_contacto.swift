//
//  pantalla_agregar_contacto.swift
//  Agenda Shuffle
//
//  Created by alumno on 3/3/25.
//

import SwiftUI

struct pantalla_agregar_contacto: View {
    @State private var nombre: String = ""
    @State private var numero_telefonico: String = ""
    
    
    var body: some View {
        Text("Colocar la etiqueta de nombre")
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 75)
                .foregroundColor(Color.cyan)
            TextField("Placeholder", text: $nombre)
                .padding(10)
        }
        
        Text("Colocar el campo del numero telefonico")
        TextField("Placeholder numeros", text: $numero_telefonico)
            .frame(height: 35)
            .padding(10)
        
        HStack{
            
            Icono(tamano: 65, ruta_icono: "person.crop.circle.badge.plus", 
                  padding: 10)
            
            Spacer()
            
            Icono(tamano: 65, ruta_icono: "return")
                .background(nombre == "" ? Color.red:
                                Color.cyan)

        }
        .background(Color.cyan)
    }
}

#Preview {
    pantalla_agregar_contacto()
}
