//
//  Tecla.swift
//  Pala
//
//  Created by Jaime Castañeda on 01/03/22.
//

import SwiftUI

struct Tecla: View {
    
    @ObservedObject var palabraViewModel: PalabrasModelView
    
    let text: String
    let colorFondo: Color
    let colorLetra: Color
    let width: Double
    let height: Double
    let opacity: Double
    
    var body: some View {
        Text(text)
            .frame(width: width,
                   height: height)
            .foregroundColor(colorLetra)
            .background(colorFondo)
            .cornerRadius(5)
            .opacity(opacity)
            .animation(palabraViewModel.animation)
    }
}

struct Tecla_Previews: PreviewProvider {
    static var previews: some View {
        Juego()
    }
}
