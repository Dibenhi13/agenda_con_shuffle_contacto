//
//  barra_busqueda.swift
//  Agenda Shuffle
//
//  Created by alumno on 3/5/25.
//

import SwiftUI


struct barra_busqueda: View {
    @State private var nombre: String = ""
    
    var contacto_a_mostrar: ContactoAgenda
    var al_pulsar: () -> Void = { print("No se ha implementado") }
    
    let esquinas_redondeadas = CGSize(width: 20, height: 20)
    
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: (10)){
            Spacer()
            
            ZStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 75)
                    .foregroundColor(Color.purple)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                TextField("Search", text: $nombre)
                    .padding(10)
                    .font(.system(size: 25))
            }

            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 50, alignment: .center)
                    .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
            }
            
            Spacer()
        }
        
        .background(Color.purple)
        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerSize: esquinas_redondeadas))
        .onTapGesture {
            al_pulsar()
        }
    }
}

#Preview {
    barra_busqueda(contacto_a_mostrar: contacto_prueba)
}
