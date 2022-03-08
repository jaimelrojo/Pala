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
            )
            .frame(width: UIScreen.main.bounds.width * width,
                   height: UIScreen.main.bounds.height * height)
        
        
//        Text(texto)
//            .foregroundColor(colorLetra)
//            .font(.system(size: UIScreen.main.bounds.height / 40,
//                          weight: .light,
//                          design: .monospaced))
//            .frame(width: UIScreen.main.bounds.width * width,
//                   height: UIScreen.main.bounds.height * height)
//            .background(colorFondo)
//            .cornerRadius(25)
    }
}

struct BotonRectangular_Previews: PreviewProvider {
    static var previews: some View {
        BotonRectangular(texto: "Empezar", colorFondo: Color("ColorPrincipalNegro"), colorLetra: Color("ColorPrincipalBlanco"), width: 0.88, height: 0.08)
    }
}
