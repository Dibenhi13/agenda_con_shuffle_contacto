//
//  pantalla_del_ganador.swift
//  Agenda Shuffle
//
//  Created by alumno on 3/5/25.
//

import SwiftUI

var contacto_alterno = ContactoAgenda(nombre: "Teléfono", telefono: "6566102367")

struct pantalla_del_ganador: View {
    var contacto_a_molestar: ContactoAgenda
    
    var body: some View {
           VStack(spacing: 20) {
               ZStack {
                   Circle()
                       .foregroundColor(Color.brown.opacity(0.3))
                       .frame(width: 250, height: 250)
                       .shadow(radius: 10)
                   Image(systemName: "phone.fill")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 100)
                       .foregroundColor(.white)
               }
               VStack(alignment: .center, spacing: 10) {
                   Text(contacto_a_molestar.nombre)
                       .font(.title)
                       .fontWeight(.bold)
                       .foregroundColor(.brown)
                   Button(action: {
                       if let phoneURL = URL(string: "tel://\(contacto_a_molestar.telefono)") {
                           UIApplication.shared.open(phoneURL)
                       }
                   }) {
                       Text(contacto_a_molestar.telefono)
                           .font(.title2)
                           .foregroundColor(.blue)
                           .underline()
                   }
               }
               .padding()
               .background(RoundedRectangle(cornerRadius: 15).fill(Color.brown.opacity(0.1)))
           }
           .padding()
       }
    }

#Preview {
    pantalla_del_ganador(contacto_a_molestar: contacto_alterno)
}

