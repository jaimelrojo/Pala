//
//  Alerta.swift
//  Pala
//
//  Created by Jaime Castañeda on 16/03/22.
//

import SwiftUI

struct Alerta: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    @ObservedObject var menuViewModel: MenuViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("ColorPrincipalNegro"))
                .cornerRadius(25)
//                .shadow(color: Color("ColorNegro"),
//                        radius: 10)
            
            VStack() {
                Spacer()
                
                VStack(spacing: UIScreen.main.bounds.height * 0.005) {
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("ColorRojo"))
                        .frame(width: UIScreen.main.bounds.width * 0.08,
                               height: UIScreen.main.bounds.width * 0.08)
                    
                    Text("¿Seguro que deseas salir?")
                        .font(.system(size: UIScreen.main.bounds.height / 30,
                                      weight: .light,
                                      design: .monospaced))
                }
                .foregroundColor(Color("ColorPrincipalBlanco"))
                .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack() {
                    Spacer()
                    
                    Button {
                        palabraViewModel.BotonAlertaCont()
                    } label: {
                        BotonRectangular(texto: "Continuar",
                                         colorFondo: Color("ColorPrincipalBlanco"),
                                         colorLetra: Color("ColorPrincipalNegro"),
                                         width: 0.415,
                                         height: 0.08,
                                         animation: palabraViewModel.animation)
                    }
                    
                    Spacer()
                    
                    Button {
                        palabraViewModel.BotonAlertaSalir()
                        menuViewModel.anchoBoton = 0.88
                        menuViewModel.altoBoton = 0.08
                    } label: {
                        BotonRectangular(texto: "Salir",
                                         colorFondo: Color("ColorRojo"),
                                         colorLetra: Color("ColorBlanco"),
                                         width: 0.415,
                                         height: 0.08,
                                         animation: palabraViewModel.animation)
                    }
                    
                    Spacer()
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

struct Alerta_Previews: PreviewProvider {
    static var previews: some View {
        Alerta(palabraViewModel: PalabrasModelView(), menuViewModel: MenuViewModel())
//        VistaPrincipal()
    }
}
