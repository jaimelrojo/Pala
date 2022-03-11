//
//  VistaPrincipal.swift
//  Pala
//
//  Created by Jaime Castañeda on 10/03/22.
//

import SwiftUI

struct VistaPrincipal: View {
    
    @StateObject var palabraViewModel: PalabrasModelView = PalabrasModelView()
    @State var isPlaying: Bool = false
    
    var body: some View {
        ZStack {
            if isPlaying {
                VStack {
                    Juego(palabraViewModel: palabraViewModel)
                }
                .transition(.move(edge: .bottom))
                
                VStack {
                    if palabraViewModel.showWinner == true {
                        Spacer()
                        RoundPopUp(palabraViewModel: palabraViewModel)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            
            VStack {
                Button {
                    isPlaying = true
                } label: {
                    Text("Empezar juego")
                }

            }
            
            VStack {
                Marcador(palabraViewModel: palabraViewModel,
                         colorFondo: isPlaying ? Color("ColorPrincipalNegro") : Color("ColorPrincipalBlanco"),
                         colorLetra: isPlaying ? Color("ColorPrincipalBlanco") : Color("ColorPrincipalNegro"))
                Spacer()
            }
        }
    }
}

struct VistaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
            .preferredColorScheme(.light)
    }
}
