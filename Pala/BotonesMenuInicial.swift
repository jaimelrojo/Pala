//
//  BotonesMenuInicial.swift
//  Pala
//
//  Created by Jaime Castañeda on 15/03/22.
//

import SwiftUI

struct BotonesMenuInicial: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    
    @State private var mailData = ComposeMailData(subject: "¡Sugerencia para Yonu!",
                                                  recipients: ["yonuapp@icloud.com"],
                                                  message: "")
    @State private var showMailView = false
    
    var body: some View {
        HStack(spacing: UIScreen.main.bounds.width * 0.08) {
            
            Button {
                
            } label: {
                BotonImage(imagen: "instagram",
                           color: Color("ColorPrincipalBlanco"),
                           ancho: 0.11,
                           altura: 0.11,
                           animacion: palabraViewModel.animation)
            }
            
            Button {
                
            } label: {
                BotonSymbol(simbolo: "chart.bar.xaxis",
                            color: Color("ColorPrincipalBlanco"),
                            ancho: 0.11,
                            altura: 0.11,
                            animacion: palabraViewModel.animation)
            }
            
            Button {
                showMailView.toggle()
            } label: {
                BotonSymbol(simbolo: "envelope",
                            color: Color("ColorPrincipalBlanco"),
                            ancho: 0.11,
                            altura: 0.11,
                            animacion: palabraViewModel.animation)
            }
        }
    }
}

struct BotonesMenuInicial_Previews: PreviewProvider {
    static var previews: some View {
        BotonesMenuInicial(palabraViewModel: PalabrasModelView())
    }
}
