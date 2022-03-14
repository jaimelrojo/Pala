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
            
            VStack {
                if palabraViewModel.juegoComenzado {
                    Juego(palabraViewModel: palabraViewModel)
                }
            }
            
            VStack {
                if palabraViewModel.juegoComenzado {
                    BotonSalir(palabraViewModel: palabraViewModel,
                               menuViewModel: menuViewModel)
                }
            }
            
            VStack {
                if palabraViewModel.showWinner {
                    Spacer()
                    RoundPopUp(palabraViewModel: palabraViewModel)
                        .offset(y: -UIScreen.main.bounds.width * 0.017)
                }
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
