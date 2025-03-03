//
//  Icono.swift
//  Agenda Shuffle
//
//  Created by alumno on 3/3/25.
//

import SwiftUI

struct Icono: View {
    var tamano: CGFloat
    var ruta_icono: String
    var padding: CGFloat = 10
    
    
    var body: some View {
        Image(systemName: ruta_icono)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: tamano, height: tamano)
            .padding(padding)
    }
}

#Preview {
    Icono(tamano: 50, ruta_icono: "plus")
}
