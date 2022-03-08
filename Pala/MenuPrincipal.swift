//
//  MenuPrincipal.swift
//  Pala
//
//  Created by Jaime Castañeda on 21/02/22.
//

import SwiftUI

struct MenuPrincipal: View {
    
    @StateObject var palabraViewModel: PalabrasModelView = PalabrasModelView()
//    @ObservedObject var palabraViewModel: PalabrasModelView
    
    @State var preGameMenu: Bool = false
    @State var preGameMenuWidth: Double = 0.88
    @State var preGameMenuHeight: Double = 0.08
    @State var isPlaying: Bool = false
    @State var textoBoton = "Comenzar"
    
    var animation: Animation = .spring(response: 0.7, dampingFraction: 0.8)
    
    var body: some View {
        
        ZStack {
            
            //MARK: CAPA 1: Fondo
            
            Color("ColorPrincipalNegro")
                .onTapGesture {
                    if preGameMenu == true {
                        preGameMenu = false
                        preGameMenuWidth = 0.88
                        preGameMenuHeight = 0.08
                        textoBoton = "Comenzar"
                    }
                }
                .edgesIgnoringSafeArea(.all)
            
            //MARK: CAPA 2: Menu principal
            
            VStack {
                
                if isPlaying == false {
                    Spacer()
                    
                    Logo()
                    
                    Spacer()
                }
                
                Button {
                    preGameMenu = true
                    preGameMenuWidth = 1
                    preGameMenuHeight = 0.58
                    textoBoton = ""
                } label: {
                    BotonRectangular(texto: textoBoton,
                                     colorFondo: Color("ColorPrincipalBlanco"),
                                     colorLetra: Color("ColorPrincipalNegro"),
                                     width: preGameMenuWidth,
                                     height: preGameMenuHeight)
                }
                .padding(.bottom, preGameMenu ? 0 : UIScreen.main.bounds.width * 0.09)
                .disabled(preGameMenu)
                .disabled(isPlaying)
                .animation(animation)
            }
            .edgesIgnoringSafeArea(.bottom)
            
            if preGameMenu == true {
                MenuDesplegable(preGameMenuHeight: $preGameMenuHeight,
                                isPlaying: $isPlaying,
                                preGameMenu: $preGameMenu)
            }
            
            if isPlaying == true {
                ZStack {
                    Juego(palabraViewModel: palabraViewModel)
                        .animation(animation)
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
    }
}
