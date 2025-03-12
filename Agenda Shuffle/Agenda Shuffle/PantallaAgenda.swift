//
//  PantallaAgenda.swift
//  Agenda Shuffle
//
//  Created by alumno on 2/26/25.
//


import SwiftUI
 
let contactos = [
    ContactoAgenda(nombre: "Harry Potter", telefono:"020 7946 0958"),
    ContactoAgenda(nombre: "Hermione Granger", telefono:"0161 850 1234"),
    ContactoAgenda(nombre: "Ron Weasley", telefono:"0117 987 6543"),
    ContactoAgenda(nombre: "Draco Malfoy", telefono:"0131 222 3344"),
    ContactoAgenda(nombre: "Neville Longbottom", telefono:"0141 999 8888"),
    ContactoAgenda(nombre: "Severus Snape", telefono:"0151 777 666"),
    ContactoAgenda(nombre: "Albus Dumbledore", telefono:"0161 444 235"),
    ContactoAgenda(nombre: "Ginny Weasley", telefono:"0900 123 4567"),
]

enum PantallasDisponibles: String, Identifiable{
    case pantalla_agregar, pantalla_del_ganador
    
    var id: String{rawValue}
    
}


struct PantallaAgenda: View {
    var largo_de_pantalla = UIScreen.main.bounds.width
    var ancho_de_pantalla = UIScreen.main.bounds.height
    
    @State var mostrar_pantalla_agregar_contacto: Bool = false
    
    @State var contactos_actuales: [ContactoAgenda] = contactos
    
    @State var pantalla_a_mostrar: PantallasDisponibles?
    
    @State var texto_busqueda: String = ""
    
       var contactos_filtrados: [ContactoAgenda] {
           if texto_busqueda.isEmpty {
               return contactos_actuales
           } else {
               return contactos_actuales.filter {
                   $0.nombre.lowercased().contains(texto_busqueda.lowercased())
               }
           }
       }
    
    var body: some View {
        NavigationStack{
            VStack{
                BarraBusqueda(textoBusqueda: $texto_busqueda, alPulsarBuscar: {
                    
                })
                .padding(.horizontal)
                
                ScrollView{
                    VStack (spacing: 10){
                        ForEach(contactos_filtrados){ contacto in
                            NavigationLink(destination: detalle_contacto(contacto: contacto)){
                                ContactoPrevista(contacto_a_mostrar: contacto)
                            }
                        }
                    }
                    .frame(alignment: Alignment.center)
                    .padding(10)
                }
            }
            .background(Color.white)
            
            Spacer()
            
            
            HStack(alignment: VerticalAlignment.center, spacing: 25) {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.brown.opacity(0.15))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color.brown)
                        .font(.system(size: 35))
                }
                .shadow(radius: 10)
                
                .onTapGesture {
                    pantalla_a_mostrar = PantallasDisponibles.pantalla_agregar
                }
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.brown.opacity(0.15))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: "shuffle")
                        .foregroundColor(Color.brown)
                        .font(.system(size: 35))
                }
                .shadow(radius: 10)
                
                .onTapGesture {
                    pantalla_a_mostrar = PantallasDisponibles.pantalla_del_ganador
                }
                
            }
            .padding(15)
            .background(Color.white)
        }
        .background(Color.brown.opacity(0.1))
        
        .sheet(item:$pantalla_a_mostrar){pantalla in
            switch(pantalla){
            case .pantalla_agregar:
                pantalla_agregar_contacto(
                    boton_salir: {
                        pantalla_a_mostrar = nil
                },
                    boton_agregar: {nombre, numero in
                       let contacto_nuevo = ContactoAgenda(nombre: nombre, telefono: numero)
                       contactos_actuales.append(contacto_nuevo)
                       pantalla_a_mostrar = PantallasDisponibles.pantalla_del_ganador
                   }
                )
            case .pantalla_del_ganador:
                pantalla_del_ganador(contacto_a_molestar: contactos_actuales.randomElement() ?? ContactoAgenda(nombre: "Desconocido", telefono: "0000"))
            }
            
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



