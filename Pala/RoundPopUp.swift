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
        ZStack {
            Rectangle()
                .foregroundColor(Color("ColorPrincipalNegro"))
                .cornerRadius(25)
//                .shadow(color: Color("ColorNegro"),
//                        radius: 10)
            
            VStack() {
                
                Spacer()
                
                    if palabraViewModel.CheckWinner() == true {
                        Text("¡Es correcto!")
                            .foregroundColor(Color("ColorPrincipalBlanco"))
                            .font(.system(size: UIScreen.main.bounds.height / 28,
                                          weight: .light,
                                          design: .monospaced))
//                            .animation(palabraViewModel.animation)
                    } else {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            Text("Suerte para la próxima")
                                .foregroundColor(Color("ColorPrincipalBlanco"))
                                .font(.system(size: UIScreen.main.bounds.height / 28,
                                              weight: .light,
                                              design: .monospaced))
                                .multilineTextAlignment(.center)
//                                .animation(palabraViewModel.animation)
                            
                            Text("La palabra era: \(palabraViewModel.palabraSeleccionada)")
                                .foregroundColor(Color("ColorPrincipalBlanco"))
                                .font(.system(size: UIScreen.main.bounds.height / 40,
                                              weight: .light,
                                              design: .monospaced))
//                                .animation(palabraViewModel.animation)
                        }
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
                }
            }
            .padding(.bottom, UIScreen.main.bounds.height * 0.05)
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height * 0.335)
        .animation(palabraViewModel.animation)
        .transition(.move(edge: .bottom))
    }
}

struct RoundPopUp_Previews: PreviewProvider {
    static var previews: some View {
//        VistaPrincipal()
        RoundPopUp(palabraViewModel: PalabrasModelView())
    }
}
