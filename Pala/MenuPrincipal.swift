//
//  MenuPrincipal.swift
//  Pala
//
//  Created by Jaime Castañeda on 21/02/22.
//

import SwiftUI

class MenuModelView: ObservableObject {
    
    @Published var mostrarMenu1: Bool = false
    @Published var alturaMenu1: Double = 0.08
    @Published var anchoMenu1: Double = 0.88
    @Published var juegoIniciado: Bool = false
    
    let animation: Animation = .spring(response: 0.7, dampingFraction: 0.8)
}

struct MenuPrincipal: View {
    
    @StateObject var menuViewModel: MenuModelView = MenuModelView()
    @StateObject var palabraViewModel: PalabrasModelView = PalabrasModelView()
//    @ObservedObject var palabraViewModel: PalabrasModelView
    
    @State var textoBoton = "Comenzar"
    
    var body: some View {
        
        ZStack {
            
            //MARK: CAPA 1: Fondo
            
            Color("ColorPrincipalNegro")
                .onTapGesture {
                    if menuViewModel.mostrarMenu1 == true {
                        menuViewModel.mostrarMenu1 = false
                        menuViewModel.anchoMenu1 = 0.88
                        menuViewModel.alturaMenu1 = 0.08
                        textoBoton = "Comenzar"
                    }
                }
                .edgesIgnoringSafeArea(.all)
            
            //MARK: CAPA 2: Menu principal
            
            VStack {
                
                if menuViewModel.juegoIniciado == false {
                    Spacer()
                    
                    Logo()
                    
                    Spacer()
                }
                
                Button {
                    menuViewModel.mostrarMenu1 = true
                    menuViewModel.anchoMenu1 = 1
                    menuViewModel.alturaMenu1 = 0.58
                    textoBoton = ""
                } label: {
                    BotonRectangular(texto: textoBoton,
                                     colorFondo: Color("ColorPrincipalBlanco"),
                                     colorLetra: Color("ColorPrincipalNegro"),
                                     width: menuViewModel.anchoMenu1,
                                     height: menuViewModel.alturaMenu1)
                }
                .padding(.bottom, menuViewModel.mostrarMenu1 ? 0 : UIScreen.main.bounds.width * 0.09)
                .disabled(menuViewModel.mostrarMenu1)
                .disabled(menuViewModel.juegoIniciado)
                .animation(menuViewModel.animation)
            }
            .edgesIgnoringSafeArea(.bottom)
            
            if menuViewModel.mostrarMenu1 == true {
                MenuDesplegable(menuViewModel: menuViewModel)
            }
            
            if menuViewModel.juegoIniciado == true {
                ZStack {
                    Juego(palabraViewModel: palabraViewModel)
                        .animation(menuViewModel.animation)
//                        .frame(height: UIScreen.main.bounds.height * 0.89)
                    
                    VStack {
                        if palabraViewModel.showWinner == true {
                            
                            Spacer()
                            
                            RoundPopUp(palabraViewModel: palabraViewModel)
                        }
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
                .transition(.move(edge: .bottom))
//                .edgesIgnoringSafeArea(.horizontal)
            }
        }
    }
}

struct MenuPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipal()
            .preferredColorScheme(.dark)
    }
}
