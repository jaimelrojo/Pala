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
    @Published var dificultades: [String] = ["Normal", "Dificil", "Extremo"]
    
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
            
            if menuViewModel.juegoIniciado == false {
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
            }
            
            //MARK: CAPA 2: Menu principal
            
            VStack {
                
                if menuViewModel.juegoIniciado == false {
                    Spacer()
                    
                    Logo()
                    
                    Spacer()
                }
                
                Button {
                    withAnimation(palabraViewModel.animation){
                        menuViewModel.juegoIniciado = true
                        menuViewModel.alturaMenu1 = 0.904
                        menuViewModel.anchoMenu1 = 1
                        textoBoton = ""
                    }
//                    menuViewModel.mostrarMenu1 = true
//                    menuViewModel.anchoMenu1 = 1
//                    menuViewModel.alturaMenu1 = 0.50
                    
                } label: {
                    BotonRectangular(texto: textoBoton,
                                     colorFondo: Color("ColorPrincipalBlanco"),
                                     colorLetra: Color("ColorPrincipalNegro"),
                                     width: menuViewModel.anchoMenu1,
                                     height: menuViewModel.alturaMenu1,
                                     animation: palabraViewModel.animation)
                }
                .padding(.bottom, menuViewModel.mostrarMenu1 ? 0 : UIScreen.main.bounds.width * 0.09)
                .disabled(menuViewModel.mostrarMenu1)
//                .disabled(menuViewModel.juegoIniciado)
                .animation(menuViewModel.animation)
            }
            .edgesIgnoringSafeArea(.bottom)
            
            //MARK: CAPA 3: Juego
            
            if menuViewModel.juegoIniciado == true {
                ZStack{
                    
                    Juego(palabraViewModel: palabraViewModel)
//                        .frame(width: UIScreen.main.bounds.width,
//                               height: UIScreen.main.bounds.height * 0.904)
                    
                    VStack {
                        if palabraViewModel.showWinner == true {
                            
                            Spacer()
                            
                            RoundPopUp(palabraViewModel: palabraViewModel)
                        }
                    }
//                    .edgesIgnoringSafeArea(.bottom)
                }
                .transition(.move(edge: .bottom))
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
