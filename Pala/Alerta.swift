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
                .shadow(color: Color("ColorNegro"),
                        radius: 10)
            
            VStack() {
                Spacer()
                
                VStack() {
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("ColorRojo"))
                        .frame(width: UIScreen.main.bounds.width * 0.08,
                               height: UIScreen.main.bounds.width * 0.08)
                    
                    Text("¿Seguro que deseas salir?")
                        .font(.system(size: UIScreen.main.bounds.height / 35,
                                      weight: .light,
                                      design: .monospaced))
                }
                .foregroundColor(Color("ColorPrincipalBlanco"))
                .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Button {
                        palabraViewModel.BotonAlertaCont()
                    } label: {
                        BotonRectangular(texto: "Continuar",
                                         colorFondo: Color("ColorPrincipalBlanco"),
                                         colorLetra: Color("ColorPrincipalNegro"),
                                         width: 0.375,
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
                                         width: 0.375,
                                         height: 0.08,
                                         animation: palabraViewModel.animation)
                    }
                }
            }
            .padding(20)
        }
        .frame(width: UIScreen.main.bounds.width * 0.9,
               height: UIScreen.main.bounds.height * 0.32)
        .animation(palabraViewModel.animation)
        .transition(.opacity)
    }
}

struct Alerta_Previews: PreviewProvider {
    static var previews: some View {
        Alerta(palabraViewModel: PalabrasModelView(), menuViewModel: MenuViewModel())
//        VistaPrincipal()
    }
}
