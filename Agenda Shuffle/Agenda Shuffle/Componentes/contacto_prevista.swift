//
//  contacto_prevista.swift
//  Agenda Shuffle
//
//  Created by alumno on 2/26/25.
//

import SwiftUI
 
let contacto_prueba = ContactoAgenda(nombre: "Juaqqerqrrn", telefono:"12345")
struct ContactoPrevista: View {
    var contacto_a_mostrar: ContactoAgenda
    var al_pulsar: () -> Void = { print("No se ha implementado") }
    
    let esquinas_redondeadas = CGSize(width: 20, height: 20)
    
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: (10)){
            Spacer()
            
            VStack {
                Image("Neville")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, alignment: .center)
                    .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
                    .background(Color.blue)
            }
            
            .background(Color.white)
            
            Spacer()
            
            VStack(alignment: HorizontalAlignment.leading, spacing: 10) {
                Text(contacto_a_mostrar.nombre)
                Text(contacto_a_mostrar.telefono)
            }
            
            .background(Color.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        
        .background(Color.red)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
        .onTapGesture {
            al_pulsar()
        }
    }
}
 
#Preview {
    ContactoPrevista(contacto_a_mostrar: contacto_prueba)
}
