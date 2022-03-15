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
                    
                    Button {

                    } label: {
                        Image(systemName: "chart.bar.xaxis")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("ColorPrincipalBlanco"))
                            .frame(width: UIScreen.main.bounds.width * 0.11,
                                   height: UIScreen.main.bounds.width * 0.11)
                            .animation(palabraViewModel.animation)
                    }
                    .transition(.move(edge: .top))
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
                    .offset(y: -UIScreen.main.bounds.height * 0.31)
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
