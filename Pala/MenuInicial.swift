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
            
            VStack(spacing: UIScreen.main.bounds.height * 0.035) {
                
                if palabraViewModel.juegoComenzado == false {
                    Spacer()
                    
                    BotonesMenuInicial(palabraViewModel: palabraViewModel)
                        .transition(.offset(y: -UIScreen.main.bounds.height))
                }
                
                Button {
                    menuViewModel.anchoBoton = 1
                    menuViewModel.altoBoton = 1
                    palabraViewModel.juegoComenzado = true
                    palabraViewModel.SelectWord()
                } label: {
                    BotonRectangular(texto: palabraViewModel.juegoComenzado ? "" : palabraViewModel.scoreActual != 0 ? "Continuar" : "Comenzar",
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
                Logo(colorLetras: palabraViewModel.juegoComenzado ? Color("ColorPrincipalNegro") : Color("ColorPrincipalBlanco"),
                     animacion: palabraViewModel.animation)
                .offset(y: palabraViewModel.juegoComenzado ? -UIScreen.main.bounds.height * 0.17 : -UIScreen.main.bounds.height * 0.12)
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
