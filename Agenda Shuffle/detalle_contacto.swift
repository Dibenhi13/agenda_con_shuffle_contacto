//
//  detalle_contacto.swift
//  Agenda Shuffle
//
//  Created by alumno on 3/12/25.
//

import SwiftUI

struct detalle_contacto: View {
    let contacto_prueba = ContactoAgenda(nombre: "Neville Longbottom", telefono:"12345")
    
    var contacto: ContactoAgenda

    var body: some View {

        VStack {
            Image("Neville")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .foregroundColor(.gray)
                .padding(.top, 40)
            

            Text(contacto.nombre)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)

            Text(contacto.telefono)
                .font(.headline)
                .foregroundColor(.gray)


            HStack(spacing: 20) {

                BotonContacto(icono: "envelope.fill", titulo: "Email")
                BotonContacto(icono: "phone.circle.fill", titulo: "Call")
                BotonContacto(icono: "star.fill", titulo: "Favorite")
                


            }
            .padding(.top, 10)

            Spacer()

        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.1))
        .navigationTitle("Details")

    }

}



struct BotonContacto: View {
    var icono: String
    var titulo: String
    var body: some View {

        VStack {
            Image(systemName: icono)
                .resizable()
                .foregroundColor(.white)
                .padding()
                .background(Color.brown)
                .cornerRadius(20)
                .scaledToFit()
                .frame(width: 80)

            Text(titulo)
                .font(.caption)
                .foregroundColor(.black)

        }

        .padding()
    }

}


#Preview {
    detalle_contacto(contacto: contacto_prueba)
}

