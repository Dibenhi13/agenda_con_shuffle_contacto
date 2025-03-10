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
        HStack(spacing: (12)){
            Image("Neville")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundColor(.brown.opacity(0.8))
            
            
            VStack (alignment: .leading, spacing: 2) {
                Text(contacto_a_mostrar.nombre)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(contacto_a_mostrar.telefono)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            .padding(.vertical, 8)
            
            Spacer()
            
        }
        .padding()
        .background(RoundedRectangle(cornerSize: esquinas_redondeadas)
            .fill(Color.brown.opacity(0.6)))
        .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
        .onTapGesture {
            al_pulsar()
        }
    }
}
 
#Preview {
    ContactoPrevista(contacto_a_mostrar: contacto_prueba)
}
