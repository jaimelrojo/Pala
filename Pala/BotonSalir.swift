//
//  BotonSalir.swift
//  Pala
//
//  Created by Jaime Castañeda on 13/03/22.
//

import SwiftUI

struct BotonSalir: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    @ObservedObject var menuViewModel: MenuViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    menuViewModel.anchoBoton = 0.88
                    menuViewModel.altoBoton = 0.08
                    palabraViewModel.juegoComenzado = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("ColorPrincipalNegro"))
                        .font(.system(size: UIScreen.main.bounds.height / 40,
                                      weight: .light,
                                      design: .monospaced))
                        .frame(width: UIScreen.main.bounds.width * 0.07,
                               height: UIScreen.main.bounds.width * 0.07)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal, UIScreen.main.bounds.width * 0.07)
        .padding(.vertical, UIScreen.main.bounds.height * 0.005)
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height * 0.904)
        .animation(palabraViewModel.animation)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}

struct BotonSalir_Previews: PreviewProvider {
    static var previews: some View {
//        BotonSalir(palabraViewModel: PalabrasModelView(),
//                   menuViewModel: MenuViewModel())
        VistaPrincipal()
    }
}
