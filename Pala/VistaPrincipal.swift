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
                
                VStack {
                    if palabraViewModel.showWinner {
                        Spacer()
                        RoundPopUp(palabraViewModel: palabraViewModel)
                    }
                }
            }
            
            VStack {
                HStack {
                    if palabraViewModel.juegoComenzado {
                        Button {
                            palabraViewModel.juegoComenzado = false
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color("ColorPrincipalNegro"))
                                .frame(width: UIScreen.main.bounds.width * 0.06,
                                       height: UIScreen.main.bounds.width * 0.06)
                                .animation(palabraViewModel.animation)
                        }
                        .transition(.move(edge: .bottom))
                    }
                    
                    Spacer()
                    
                    Marcador(palabraViewModel: palabraViewModel,
                             menuViewModel: menuViewModel)
                    //                        .offset(y: palabraViewModel.juegoComenzado ? 0 : 100)
                    
                    Spacer()
                    
                    VStack {
                        if palabraViewModel.juegoComenzado {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.1,
                                       height: UIScreen.main.bounds.width * 0.1)
                                .opacity(0)
                        }
                    }
                }
                .padding(.horizontal)
                
                if palabraViewModel.juegoComenzado {
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 0.904)
        }
    }
}

struct VistaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
            .preferredColorScheme(.light)
    }
}
