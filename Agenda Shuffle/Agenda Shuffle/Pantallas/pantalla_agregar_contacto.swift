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
    
    var boton_salir: () -> Void = {
        print("Cerrando pantalla de agregar contacto")
    }
    
    
    var boton_agregar: (_ nombre : String, _ numero: String) -> Void = {nombre, numero in
        print("Agregando contacto: \(nombre) - \(numero)")
    }
    
    
    var body: some View {
        VStack(spacing: 20){
            Text("Nuevo Contacto")
                .font(.title)
                .bold()
                .foregroundColor(.brown)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Nombre")
                    .foregroundColor(.brown)
                    .bold()
                TextField("Ingrese el nombre",text: $nombre)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 10)
            {
                Text("Número Telefónico")
                    .foregroundColor(.brown)
                    .bold()
                TextField("Ingrese el número", text: $numero_telefonico)
                    .keyboardType(.phonePad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack{
                Button(action:{
                    boton_agregar(nombre, numero_telefonico)
                })
                {
                    HStack{
                        Image(systemName: "person.crop.circle.badge.plus")
                        Text("Agregar")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(nombre.isEmpty || numero_telefonico.isEmpty)
                
                Button(action: {
                    boton_salir()
                })
                {
                    HStack{
                        Image(systemName: "xmark.circle")
                        Text("Cancelar")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    pantalla_agregar_contacto()
}
