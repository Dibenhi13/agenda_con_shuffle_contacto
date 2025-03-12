//
//  barra_busqueda.swift
//  Agenda Shuffle
//
//  Created by alumno on 3/5/25.
//

import SwiftUI
struct BarraBusqueda: View {
    @Binding var textoBusqueda: String
    
   var alPulsarBuscar: () -> Void = { print("Buscar no implementado") }
    
   let esquinasRedondeadas = CGSize(width: 15, height: 15)
    
   var body: some View {
       HStack {
           TextField("Buscar contacto", text: $textoBusqueda)
               .padding()
               .background(Color(UIColor.systemBackground))
               .cornerRadius(10)
               .shadow(radius: 1)
           
           Button(action: alPulsarBuscar) {
               Image(systemName: "magnifyingglass")
                   .foregroundColor(.white)
                   .padding()
                   .background(Color.brown)
                   .cornerRadius(10)
           }
       }
       .padding()
       .background(Color(UIColor.secondarySystemBackground))
       .cornerRadius(15)
       .shadow(radius: 2)
   }
}
#Preview {
    @State var texto = ""
    return BarraBusqueda(textoBusqueda: $texto)
}
