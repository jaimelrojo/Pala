//
//  VistaPrincipal.swift
//  Pala
//
//  Created by Jaime Castañeda on 10/03/22.
//

import SwiftUI

struct VistaPrincipal: View {
    
    @StateObject var palabraViewModel: PalabrasModelView = PalabrasModelView()
    @StateObject var menuViewModel: MenuViewModel = MenuViewModel()
    
    var body: some View {
        ZStack {
            
            VStack {
                MenuInicial(palabraViewModel: palabraViewModel,
                            menuViewModel: menuViewModel)
            }
            
            if palabraViewModel.juegoComenzado {
                VStack {
                    Juego(palabraViewModel: palabraViewModel)
                }
                .transition(.move(edge: .bottom))
            }
            
            if palabraViewModel.juegoComenzado {
                VStack {
                    BotonSalir(palabraViewModel: palabraViewModel,
                               menuViewModel: menuViewModel)
                }
                .transition(.move(edge: .bottom))
            }
            
            if palabraViewModel.showWinner {
                VStack {
                    Spacer()
                    RoundPopUp(palabraViewModel: palabraViewModel)
                        .offset(y: -UIScreen.main.bounds.width * 0.017)
                }
                .transition(.move(edge: .bottom))
                
            }
            
            Marcador(palabraViewModel: palabraViewModel,
                     menuViewModel: menuViewModel)
        }
    }
}

struct VistaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
            .preferredColorScheme(.light)
    }
}
