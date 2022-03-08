//
//  MenuDesplegable.swift
//  Pala
//
//  Created by Jaime Castañeda on 21/02/22.
//

import SwiftUI

struct MenuDesplegable: View {
    
    @ObservedObject var menuViewModel: MenuModelView
    
//    var animation: Animation = .spring(response: 0.7, dampingFraction: 0.8)
    @State var dificultades: [String] = ["Facil", "Medio", "Dificil", "Experto"]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            Text("Elige la dificultad")
                .foregroundColor(Color("ColorPrincipalNegro"))
                .font(.system(size: UIScreen.main.bounds.height / 40,
                              weight: .light,
                              design: .monospaced))
                .animation(menuViewModel.animation.delay(0.2))
            
//            Picker("", selection: $dificultades) {
//                ForEach(0..<4) { index in
//                    Text("\(dificultades[index])")
//                        .font(.system(size: UIScreen.main.bounds.height / 40,
//                                      weight: .light,
//                                      design: .monospaced))
//                        .foregroundColor(Color("ColorPrincipalBlanco"))
//                        .frame(width: UIScreen.main.bounds.width * 0.95,
//                               height: UIScreen.main.bounds.height * 0.034)
//                        .background(Color("ColorPrincipalNegro").opacity(1))
//                        .cornerRadius(5)
//                        .tag(index)
//                }
//            }
//            .pickerStyle(.wheel)
//            .frame(width: UIScreen.main.bounds.width,
//                   height: UIScreen.main.bounds.height * 0.35)
//            .animation(animation.delay(0.1))
            
            Button {
                menuViewModel.alturaMenu1 = UIScreen.main.bounds.height
                menuViewModel.mostrarMenu1 = false
                menuViewModel.juegoIniciado = true
            } label: {
                BotonRectangular(texto: "Continuar", colorFondo: Color("ColorPrincipalNegro"), colorLetra: Color("ColorPrincipalBlanco"), width: 0.88, height: 0.08)
                    .animation(menuViewModel.animation)
//                Rectangle()
//                    .cornerRadius(25)
//                    .foregroundColor(Color("ColorPrincipalNegro"))
//                    .frame(width: UIScreen.main.bounds.width * 0.83,
//                           height: UIScreen.main.bounds.height * 0.1)
//                    .overlay(
//                        Text("Continuar")
//                            .foregroundColor(Color("ColorPrincipalBlanco"))
//                            .font(.system(size: UIScreen.main.bounds.height / 40,
//                                          weight: .light,
//                                          design: .monospaced))
//                    )
//                    .animation(animation)
            }
        }
        .transition(.move(edge: .bottom))
        
    }
}

struct MenuDesplegable_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipal()
    }
}
