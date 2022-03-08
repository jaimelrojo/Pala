//
//  WinnerPopUp.swift
//  Pala
//
//  Created by Jaime Castañeda on 24/02/22.
//

import SwiftUI

struct RoundPopUp: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    
    var body: some View {
        Rectangle()
            .foregroundColor(palabraViewModel.CheckWinner() ? .green : .red)
            .overlay(
                VStack {
                    
                    Spacer()
                    
                    if palabraViewModel.CheckWinner() == true {
                        Text("Ganador")
                            .foregroundColor(Color("ColorBlanco"))
                            .font(.system(size: UIScreen.main.bounds.height / 28,
                                          weight: .light,
                                          design: .monospaced))
                            .animation(.spring(response: 0.6, dampingFraction: 0.8))
                    } else {
                        Text("Perdedor")
                            .foregroundColor(Color("ColorBlanco"))
                            .font(.system(size: UIScreen.main.bounds.height / 28,
                                          weight: .light,
                                          design: .monospaced))
                            .animation(.spring(response: 0.6, dampingFraction: 0.8))
                    }
                    
                    Spacer()
                    
                    Button {
                        palabraViewModel.NewRound()
                        palabraViewModel.showWinner.toggle()
                    } label: {
                        BotonRectangular(texto: "Siguiente palabra", colorFondo: Color("ColorPrincipalBlanco"), colorLetra: Color("ColorPrincipalNegro"), width: 0.88, height: 0.08)
                    }
                    .padding(.bottom, UIScreen.main.bounds.width * 0.09)
                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.1))
                }
            )
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 0.327)
            .cornerRadius(25)
            .animation(.spring(response: 0.6, dampingFraction: 0.8))
            .transition(.move(edge: .bottom))
    }
}

struct RoundPopUp_Previews: PreviewProvider {
    static var previews: some View {
        Juego()
            
    }
}
