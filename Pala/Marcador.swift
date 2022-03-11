//
//  Marcador.swift
//  Pala
//
//  Created by Jaime Castañeda on 10/03/22.
//

import SwiftUI

struct Marcador: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    let colorFondo: Color
    let colorLetra: Color
    
    @State var mostrarPalabraScore: Bool = true
    @State var anchoScore: Double = 0.55
    @State var conteoTimer: Timer?
    @State var conteoCounter = 0
    
    var body: some View {
        HStack {
            BotonRectangular(texto: mostrarPalabraScore ? "Puntuación: \(palabraViewModel.scoreActual)" : "\(palabraViewModel.scoreActual)",
                             colorFondo: colorFondo,
                             colorLetra: colorLetra,
                             width: anchoScore,
                             height: 0.04,
                             animation: .spring(response: 0.7, dampingFraction: 0.8))
                .onAppear {
                    conteoTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { index in
                        if conteoCounter < 4 {
                            conteoCounter += 1
                        } else {
                            conteoTimer?.invalidate()
                            mostrarPalabraScore = false
                            anchoScore = 0.20
                            conteoCounter = 0
                        }
                    }
                }
                .onTapGesture {
                    if mostrarPalabraScore == false {
                        mostrarPalabraScore = true
                        anchoScore = 0.55
                        conteoTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { index in
                            if conteoCounter < 4 {
                                conteoCounter += 1
                            } else {
                                conteoTimer?.invalidate()
                                mostrarPalabraScore = false
                                anchoScore = 0.20
                                conteoCounter = 0
                            }
                        }
                    } else {
                        conteoCounter = 0
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
