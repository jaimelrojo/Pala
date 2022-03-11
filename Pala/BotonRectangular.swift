//
//  BotonRectangular.swift
//  Pala
//
//  Created by Jaime Castañeda on 05/03/22.
//

import SwiftUI

struct BotonRectangular: View {
    
    let texto: String
    let colorFondo: Color
    let colorLetra: Color
    let width: Double
    let height: Double
    let animation: Animation
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(colorFondo)
            .cornerRadius(25)
            .overlay(
                Text(texto)
                    .foregroundColor(colorLetra)
                    .font(.system(size: UIScreen.main.bounds.height / 40,
                                  weight: .light,
                                  design: .monospaced))
                    .multilineTextAlignment(.center)
            )
            .frame(width: UIScreen.main.bounds.width * width,
                   height: UIScreen.main.bounds.height * height)
            .animation(animation)
    }
}

//struct BotonRectangular_Previews: PreviewProvider {
//    static var previews: some View {
//        Juego()
//    }
//}
