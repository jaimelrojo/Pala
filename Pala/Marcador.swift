//
//  Marcador.swift
//  Pala
//
//  Created by Jaime Castañeda on 10/03/22.
//

import SwiftUI

struct Marcador: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    @ObservedObject var menuViewModel: MenuViewModel
    
    var body: some View {
        VStack {
            HStack {
                if palabraViewModel.juegoComenzado == false {
                    Text(palabraViewModel.scoreActual == 0 ? "Puntuación máxima " : "Puntuación actual ")
                        .foregroundColor(Color("ColorPrincipalBlanco"))
                        .font(.system(size: UIScreen.main.bounds.height / 40,
                                      weight: .light,
                                      design: .monospaced))
                        .animation(palabraViewModel.animation)
                        .transition(.offset(x: -UIScreen.main.bounds.width * 0.9))
                }
                
                BotonRectangular(texto: palabraViewModel.juegoComenzado ? "\(palabraViewModel.scoreActual)" : palabraViewModel.scoreActual == 0 ? "\(palabraViewModel.highScore)" : "\(palabraViewModel.scoreActual)",
                                 colorFondo: palabraViewModel.juegoComenzado ? Color("ColorPrincipalNegro") : Color("ColorPrincipalBlanco"),
                                 colorLetra: palabraViewModel.juegoComenzado ? Color("ColorPrincipalBlanco") : Color("ColorPrincipalNegro"),
                                 width: 0.20,
                                 height: 0.04,
                                 animation: palabraViewModel.animation)
            }
            if palabraViewModel.juegoComenzado == false {
                if palabraViewModel.scoreActual > 0 {
                    HStack {
                        Text("Puntuación máxima ")
                            .foregroundColor(Color("ColorPrincipalBlanco"))
                            .font(.system(size: UIScreen.main.bounds.height / 40,
                                          weight: .light,
                                          design: .monospaced))
                            .animation(palabraViewModel.animation)
                        
                        BotonRectangular(texto: "\(palabraViewModel.highScore)",
                                         colorFondo: palabraViewModel.juegoComenzado ? Color("ColorPrincipalNegro") : Color("ColorPrincipalBlanco"),
                                         colorLetra: palabraViewModel.juegoComenzado ? Color("ColorPrincipalBlanco") : Color("ColorPrincipalNegro"),
                                         width: 0.20,
                                         height: 0.04,
                                         animation: palabraViewModel.animation)
                    }
                    .transition(.offset(x: -UIScreen.main.bounds.width * 0.9))
                }
            }
            
            if palabraViewModel.juegoComenzado {
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height * 0.904)
    }
}

struct Marcador_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VistaPrincipal()
                .preferredColorScheme(.dark)
        }
    }
}
