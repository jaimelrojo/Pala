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
            .foregroundColor(Color("ColorPrincipalNegro"))
            .overlay(
                VStack {
                    
                    Spacer()
                    
                    if palabraViewModel.CheckWinner() == true {
                        Text("Ganador")
                            .foregroundColor(Color("ColorPrincipalBlanco"))
                            .font(.system(size: UIScreen.main.bounds.height / 28,
                                          weight: .light,
                                          design: .monospaced))
                            .animation(palabraViewModel.animation)
                    } else {
                        Text("Perdedor")
                            .foregroundColor(Color("ColorPrincipalBlanco"))
                            .font(.system(size: UIScreen.main.bounds.height / 28,
                                          weight: .light,
                                          design: .monospaced))
                            .animation(palabraViewModel.animation)
                        
                        Spacer()
                        
                        Text("La palabra era: \(palabraViewModel.palabraSeleccionada)")
                            .foregroundColor(Color("ColorPrincipalBlanco"))
                            .font(.system(size: UIScreen.main.bounds.height / 38,
                                          weight: .light,
                                          design: .monospaced))
                            .animation(palabraViewModel.animation)
                    }
                    
                    Spacer()
                    
                    Button {
                        palabraViewModel.NewRound()
                        palabraViewModel.showWinner.toggle()
                    } label: {
                        BotonRectangular(texto: palabraViewModel.CheckWinner() ? "Siguiente palabra" : "Comienza de nuevo",
                                         colorFondo: Color("ColorPrincipalBlanco"),
                                         colorLetra: Color("ColorPrincipalNegro"),
                                         width: 0.88,
                                         height: 0.08,
                                         animation: palabraViewModel.animation)
                            .padding(.bottom, UIScreen.main.bounds.width * 0.09)
                    }
                    .animation(palabraViewModel.animation.delay(0.1))
                }
            )
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 0.328)
            .cornerRadius(25)
            .animation(palabraViewModel.animation)
            .transition(.move(edge: .bottom))
    }
}

struct RoundPopUp_Previews: PreviewProvider {
    static var previews: some View {
        RoundPopUp(palabraViewModel: PalabrasModelView() )
    }
}
