//
//  MenuInicial.swift
//  Pala
//
//  Created by Jaime Castañeda on 10/03/22.
//

import SwiftUI

struct MenuInicial: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    @ObservedObject var menuViewModel: MenuViewModel
    
    var body: some View {
        ZStack {
            
            Color("ColorPrincipalNegro")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                if palabraViewModel.juegoComenzado == false {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "chart.bar.xaxis")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("ColorPrincipalBlanco"))
                            .frame(width: UIScreen.main.bounds.width * 0.11,
                                   height: UIScreen.main.bounds.width * 0.11)
                    }
                }
                
                Button {
                    menuViewModel.anchoBoton = 1
                    menuViewModel.altoBoton = 1
                    palabraViewModel.juegoComenzado = true
                    menuViewModel.EraseWordPuntuacion()
                } label: {
                    BotonRectangular(texto: palabraViewModel.juegoComenzado ? "" : "Comenzar",
                                     colorFondo: Color("ColorPrincipalBlanco"),
                                     colorLetra: Color("ColorPrincipalNegro"),
                                     width: menuViewModel.anchoBoton,
                                     height: menuViewModel.altoBoton,
                                     animation: palabraViewModel.animation)
                }
                .edgesIgnoringSafeArea(.all)
                .disabled(palabraViewModel.juegoComenzado)
            }
            
            VStack {
                Logo(colorLetras: palabraViewModel.juegoComenzado ? Color("ColorPrincipalNegro") : Color("ColorPrincipalBlanco"))
                    .offset(y: -UIScreen.main.bounds.height * 0.154)
                    .opacity(palabraViewModel.juegoComenzado ? 0.6 : 1)
            }
        }
    }
}

struct MenuInicial_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
    }
}
