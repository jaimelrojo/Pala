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
        HStack {
            BotonRectangular(texto: menuViewModel.mostrarPalabraScore ? "Puntuación: \(palabraViewModel.scoreActual)" : "\(palabraViewModel.scoreActual)",
                             colorFondo: palabraViewModel.juegoComenzado ? Color("ColorPrincipalNegro") : Color("ColorPrincipalBlanco"),
                             colorLetra: palabraViewModel.juegoComenzado ? Color("ColorPrincipalBlanco") : Color("ColorPrincipalNegro"),
                             width: menuViewModel.anchoScore,
                             height: 0.04,
                             animation: palabraViewModel.animation)
                .onTapGesture {
                    if palabraViewModel.juegoComenzado {
                        menuViewModel.TapPuntuacion()
                    }
                }
        }
    }
}

struct Marcador_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
    }
}
